#!/usr/bin/env python3
"""Add a fixed render-only cat eye layer to collar icon jobs.

The spawner overrides intentionally match only role and Coat. This script only
updates the Blockbench render jobs so generated icons include one representative
eye texture without creating runtime overrides for every eye variant.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def load_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def resolve_common_file(root: Path, asset_path: str) -> str:
    return str((root / "Common" / Path(asset_path.replace("/", "\\"))).resolve())


def find_eye_option(model_json: dict, option_name: str) -> dict:
    eyes = model_json.get("RandomAttachmentSets", {}).get("Eyes", {})
    option = eyes.get(option_name)
    if not isinstance(option, dict):
        raise ValueError(f"Eye option '{option_name}' was not found in model.")
    return option


def add_eye_overlay(jobs_path: Path, asset_root: Path, option_name: str) -> int:
    payload = load_json(jobs_path)
    changed = 0
    model_cache: dict[str, dict] = {}

    for job in payload.get("jobs", []):
        model_source = job.get("modelSource")
        if not isinstance(model_source, str) or not model_source:
            raise ValueError(f"Job is missing modelSource: {job.get('id')}")
        model_path = Path(model_source)
        if not model_path.exists():
            model_path = asset_root / "Server" / "Models" / Path(job["baseModel"].replace("/", "\\")).name
        model_key = str(model_path.resolve())
        if model_key not in model_cache:
            model_cache[model_key] = load_json(model_path)
        model_json = model_cache[model_key]
        eye = find_eye_option(model_json, option_name)

        assets = job.setdefault("selectedOptionAssets", [])
        assets = [asset for asset in assets if asset.get("set") != "Eyes"]
        assets.append(
            {
                "set": "Eyes",
                "option": option_name,
                "model": eye.get("Model"),
                "texture": eye.get("Texture"),
                "weight": float(eye.get("Weight", 0)),
                "modelFile": resolve_common_file(asset_root, eye["Model"]),
                "textureFile": resolve_common_file(asset_root, eye["Texture"]),
            }
        )
        job["selectedOptionAssets"] = assets
        changed += 1

    jobs_path.write_text(json.dumps(payload, indent=2, ensure_ascii=True) + "\n", encoding="utf-8")
    return changed


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--jobs", required=True, type=Path)
    parser.add_argument("--asset-root", default=".", type=Path)
    parser.add_argument("--eye-option", default="YellowDefault")
    args = parser.parse_args()

    count = add_eye_overlay(args.jobs, args.asset_root.resolve(), args.eye_option)
    print(f"Updated {count} render jobs with render-only Eyes={args.eye_option}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
