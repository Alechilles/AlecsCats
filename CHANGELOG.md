# Changelog

All notable changes to **Alec's Cats!** will be documented in this file.

## 1.4.1 - Tamework Integration and Capture Flow - 2026-02-07
### Changed
- Small tweaks for compatability with new Tamework follow components
- Slight progress on Lulu texture

## 1.4.0 - Tamework Integration and Capture Flow - 2026-02-02
### Added
- Ownership and tamed state stored on NPCs via new Tamework components.
- Attachment preservation when capturing/spawning cats (coat variants persist).
- Damage configuration options (invulnerable to owner (default), all players, or all sources).
- Inventory icons for captured Cats change dynamically to match the stored Cat's appearance.

### Changed
- Taming flow now uses the new Tamework capture system.
- Interaction logic aligned with Tamework owner/tamed rules (owner-only interaction and capture).
- Merged Cat_Pet logic into Cat logic, using the new IsTamed flag from Tamework, allowing for one Cat to handle both the wild and tamed behaviors in one.
- Interaction particles/icons now come from **Alec's Tamework!** assets (client must load the Tamework assets pack).
- Per-world item config overrides load from:
  `<UserData>/Saves/<World>/mods/Alec's Cats!/Tamework_Items_Config.json` (auto-created empty; leave empty to inherit defaults).

### Notes
- Tamework settings control owner damage protection and related rules in `Alec's Cats!/Server/Tamework/`

## 1.3.0 - Massive Refactor and Sounds - 2026-01-29
### Added
- Dependency on **Alec's Tamework!** for shared tame/follow/hold/defend/sleep components.
- Purring sounds when sleeping.
- Interaction sounds (Hold, Follow, Defend, Feed, PickUp).
- More advanced combat behavior.

### Changed
- Refactored pet and predator cat templates to use Tamework components (IdleFollow, Hold, Sleep).
- Interaction item IDs (spawner empty/filled, food items) parameterized in templates.
- Separation handling adjusted for Hold behavior and componentized flow.
- Sleep/hold transitions and wake behavior aligned between Cat_Pet and Predator_Cat.

### Fixed
- Target reset loops in combat and follow behavior.
- Hold/follow toggling edge cases (sleep/wake flapping, animation sticking).
- Back-off behavior and chase gating to avoid jitter.
- Missing wake/stand transitions causing sliding/idle lockups.
- Pet Cat item being held in an odd way.

## 1.2.2 - Taming Fixes - 2026-01-27
- Defend combat behavior improvements and fixes.
- Sliding away from player while in Hold state fixed.

## 1.2.1 - Taming Polish - 2026-01-26
### Added
- Sit animation.
- StandUp animation.

### Changed
- Sleep animation slightly improved.
- Wake and Laydown animations replaced.
- Memories configured (replaced placeholders with real Cat memory).

## 1.2.0 - Taming System Additions - 2026-01-25
### Added
- Defend mode (cat follows the player and engages nearby enemies).
- Indicators for changing pet modes when interacting:
  - Paw Print: Follow
  - Hand: Stay
  - Shield: Defend

## 1.1.2 - Localization - 2026-01-23
### Added
- Localization for:
  - ar-SA
  - bn-BD
  - de-DE
  - en-US
  - es-ES
  - fr-FR
  - hi-IN
  - ja-JP
  - pa-IN
  - pt-BR
  - ru-RU
  - zh-CN

### Fixed
- Missing name entry for tamed cats.

## 1.1.1 - Spawning Tweaks - 2026-01-21
Cats were appearing slightly more rarely than intended, so weights were adjusted and Zone 3 forests were added. You are meant to have to search for one, and they shouldn't be everywhere.

### Changed
- Zone 1 Forests:
  - Weight: 1 -> 4
  - Added Flock: Group_Tiny
- Zone 1 Plains:
  - Weight: 2 -> 4
  - Added Flock: Group_Tiny
- Zone 3 Forests:
  - Added with Weight: 5
  - Added with Flock: Group_Tiny

## 1.1.0 - Taming Beta - 2026-01-20
### Added
- Cats can now be tamed.

### Taming process
- Craft a Cat Collar at a Workbench (Tier 2) with 3 Light Leather and 1 Gold Bar.
- Feed a cat a piece of raw fish to make it friendly.
- Use the Cat Collar on the cat to pick it up and tame it permanently.

### Tamed behavior
- Click with the Cat in your hand to place it in the world.
- You get the collar back and can use it on the cat again to pick it back up.
- On placement it stays still (default behavior so it doesn't chase you down if you left it somewhere and reloaded your game).
- Interact with the cat without fish or a collar in your hand to tell it to follow.
- Interact again to tell it to stay.
- Interact with the cat with raw fish in your hand to feed the cat and restore its health.

## 1.0.3 - New Cat - 2026-01-17
### Added
- Nyxie (light gray with white spot on chest).

## 1.0.2 Hotfix - 2026-01-17
### Fixed
- Cats sliding after sleeping instead of waking up first.
  - Wake and Laydown animations did not exist.
  - Added placeholder Wake and Laydown animations from Fox to resolve.

## 1.0.1 Hotfix - 2026-01-16
### Fixed
- Jumbled default cat appearance.
  - Hytale update 1 changed the cat model.
  - The mod was referencing a local copy of the texture instead of the base game model.

## 1.0.0 - Initial Release - 2026-01-16
### Added
- Unused Cat model, texture, and animations added to the game.
- Behaviors ported from Foxes to new Cat behaviors.
- Behaviors slightly changed.
- Second Cat texture variant added.
- Spawns added to Plains, Forests, Autumn, and Azure.