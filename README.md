[![CurseForge Downloads](https://img.shields.io/curseforge/dt/1432112?style=for-the-badge&logo=curseforge&color=rgb(241%2C100%2C54))](https://www.curseforge.com/hytale/mods/alecs-cats)
[![Discord](https://img.shields.io/discord/1468261809739005996?style=for-the-badge&logo=discord&logoColor=white&label=Join%20Discord&color=rgb(88,101,242))](https://discord.gg/E8n8RgTTdq)
[![GitHub Repo stars](https://img.shields.io/github/stars/Alechilles/AlecsCats?style=for-the-badge&logo=github&label=GitHub)](https://github.com/Alechilles/AlecsCats)

Alec's Cats! adds tamable companion cats to Hytale, powered by **[Alec's Tamework!](https://www.curseforge.com/hytale/mods/alecs-tamework)**.

## Summary
This mod started as a simple cat conversion from unused base-game assets and has grown into a full pet system with:
- Taming + ownership
- Capture/spawn with persistent appearance variants
- Follow / Defend / Stay behaviors
- Command-item controls (Follow, Hold, Recall, Move To Ping, Set Home, Return Home, Attack Target)
- Multi-language localization

## What's New in 1.5.0
- Added the **Cat Treat Bag** command item (AlecsCats_Command_Item).
- Added command wheel + left-click command execution via Tamework command items.
- Added command config for cats with move/home/recall/attack support.
- Added command-item localization keys in all supported locales.
- Updated for latest server compatibility (ServerVersion: 2026.02.19-1A311A592).

## Requirements
- **Alec's Tamework!** dependency is required (Alechilles:Alec's Tamework!).
- No separate legacy Tamework assets pack is needed.

## Craftable Items
### Cat Collar
- 3x Light Leather
- 1x Gold Bar
- Bench: Workbench Tier 2 (Tinkering)

### Cat Treat Bag
- 2x Light Leather
- 5x Raw Fish
- 5x Raw Meat
- Bench: Workbench Tier 2 (Tinkering)

## Quick Use
1. Find a wild cat.
2. Feed raw fish to make it friendly.
3. Use a **Cat Collar** to capture/tame it.
4. Place your cat from the **Soul Lantern** item.
5. Use one of these control methods:
   - Interact directly to cycle basic modes (Follow / Defend / Stay).
   - Use the **Cat Treat Bag** for advanced commands.

## Cat Treat Bag (Command Item)
- **Left click on a cat**: link/unlink that cat to the bag.
- **Right click**: open command selection wheel.
- **Left click (while not targeting link action)**: execute selected command on linked cats.

Default commands:
- Follow
- Hold
- Recall
- Move To Ping
- Set Home
- Return Home
- Attack Target

Notes:
- Commands require ownership + tamed cats by default.
- Commands are configured in:
  - Server/Tamework/Items/Commands/AlecsCats_Command_Item_Config.json

## Taming and Ownership
- Taming assigns ownership.
- Only the owner can interact with/store the cat by default.
- When stored in an item, ownership can be cleared until re-spawn (trading-friendly flow).
- Owner damage/invulnerability behavior is controlled by Tamework global config:
  - <Alec's Tamework!>/Server/Tamework/Global/*.json

  ## Spawns
Cats are uncommon but not extremely rare.
- Zone 1: Plains, Forests
- Zone 3: Forests

They usually spawn solo, but can spawn in small groups.

## Color Variants
- Default black/white
- Missy (dark gray)
- Nyxie (light gray with white markings)

## Config Files
- Cat interaction config:
  - Server/Tamework/Interactions/AlecsCats_Cat_InteractionConfig.json
- Cat spawner config:
  - Server/Tamework/Items/Spawners/AlecsCats_Spawner_Cat.json
- Cat command-item config:
  - Server/Tamework/Items/Commands/AlecsCats_Command_Item_Config.json

After editing item configs, run:
- /tw reloadconfig



## Known Issues
- Some wake/laydown animation transitions are still placeholder quality and will be improved.

## Issue Reporting
If you run into issues, please report them here:
- https://github.com/Alechilles/AlecsCats/issues/new

