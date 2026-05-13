[![Cats](https://img.shields.io/curseforge/dt/1432112?label=Cats&style=for-the-badge&logo=curseforge&color=rgb(241%2C100%2C54))](https://www.curseforge.com/hytale/mods/alecs-cats)
[![Tamework](https://img.shields.io/curseforge/dt/1447962?label=Tamework&style=for-the-badge&logo=curseforge&color=rgb(241%2C100%2C54))](https://www.curseforge.com/hytale/mods/alecs-tamework)
[![Nametags](https://img.shields.io/curseforge/dt/1464844?label=Nametags&style=for-the-badge&logo=curseforge&color=rgb(241%2C100%2C54))](https://www.curseforge.com/hytale/mods/alecs-nametags)
[![Animal Husbandry](https://img.shields.io/curseforge/dt/1480275?label=Animal%20Husbandry&style=for-the-badge&logo=curseforge&color=rgb(241%2C100%2C54))](https://www.curseforge.com/hytale/mods/alecs-animal-husbandry)

[![Discord](https://img.shields.io/discord/1468261809739005996?style=for-the-badge&logo=discord&logoColor=white&label=Join%20Discord&color=rgb(88,101,242))](https://discord.gg/E8n8RgTTdq)
[![Buy me a coffee](https://img.shields.io/badge/ko--fi-Support%20Me-ff5f5f?logo=ko-fi&style=for-the-badge)](https://ko-fi.com/alechilles)

[![Creator Code](https://img.shields.io/badge/Creator%20Code-Alec-00AEEF?style=for-the-badge)](https://hytale.com/)

[![Featured in Hytale Magazine](https://hytalemagazine.com/badges/featured-in-hytale-magazine.png)](https://hytalemagazine.com/issues/issue-001)

## Summary
This mod started as a simple cat conversion from unused base-game assets and has grown into a full pet system with:
- Taming + ownership
- Capture/spawn with persistent appearance variants
- Command controls (Follow, Hold, Recall, Move To Ping, Set Home, Return Home, Attack Target)
- Happiness/needs simulation with resource seeking
- Passive companion breeding
- Trait generation and inheritance for bred companion cats
- Multi-language localization

## Requirements
- **Alec's Tamework!** `2.10.x` dependency is required (Alechilles:Alec's Tamework!) for parent-line breeding role inheritance and pre-1.9.0 eye attachment migration.

## Craftable Items
### Cat Collar (Capture/Spawn Item)
- 3x Light Leather
- 1x Gold Bar
- Bench: Workbench Tier 2 (Tinkering)

### Cat Treat Bag (Command Item)
- 2x Light Leather
- 5x Raw Fish
- 5x Raw Meat
- Bench: Workbench Tier 2 (Tinkering)

## Quick Start
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

## Taming and Ownership
- Taming assigns ownership.
- Only the owner can interact with/store the cat by default.
- When stored in an item, ownership can be cleared until re-spawn (trading-friendly flow).
- Owner damage/invulnerability behavior is controlled by Tamework companion config:
  - Alec's Cats!\Server\Tamework\Companion\ACCompCat.json

## Happiness and Needs
- Happiness fluctuates based on if the Cat's needs are being met
- Cats will automatically eat raw fish or Tamework Carnivore Kibble from storage containers nearby
- Tamework Carnivore Kibble can also be used as backup hand-feed, but it is less satisfying than their preferred food
- Cats will automatically drink water from water sources nearby
- Cats prefer to have at least one cat friend nearby, but don't like to be overcrowded
- Cats like when their owner is nearby

## Breeding and Traits
- Cats can automatically breed if they are happy and have a suitable partner
- Cats can spawn with 0-4 traits
- Traits can alter anything from size, to strength, to fertility and more
- Traits can be inherited from parents, and breeding cats with the same traits together can result in higher trait values (or lower!)
- Fur and eye color are also inherited from parents
- Body type roles can be inherited from either parent, with a small chance of a different body type appearing as a mutation

## Spawns
Cats are uncommon but not extremely rare.
- Zone 1: Plains, Forests
- Zone 3: Forests

They usually spawn solo, but can spawn in small groups.

## Color Variants
#### _All cat textures are now made by an artist far more skilled than me, [Celly (@Excel Lynt)](https://www.curseforge.com/members/excel_lynt/)._

Eye colors are separate randomized attachments, so cats can inherit eyes independently from coat color.

- Default black/white
- Missy (Darker Dust Kitty)
- Nyxie (Lighter Dust Kitty with a few white spots)
- Silver Tabby
- Orange Tabby
- Brown Tabby
- White
- Cream
- Cream Tuxedo
- Gray Tuxedo
- Brown Tuxedo
- Light Orange Tabby Tuxedo
- Black
- Snowshoe
- Cream Semi-Tabby
- Dark Gray Tabby
- Siamese

## Body Types
- Mediumhair
- Longhair
- Shorthair
- Bobtail

## Config Files
- Companion Config:
  - Server/Tamework/Companion/ACCompCat.json
- Interaction Config:
  - Server/Tamework/Interactions/ACIntCat.json
  - Server/Tamework/Interactions/ACIntCatTemp.json
- Spawner Config:
  - Server/Tamework/Items/Spawners/ACSpawnCat.json
- Command-item Config:
  - Server/Tamework/Items/Commands/ACCommCat.json
- Happiness Config:
  - Server/Tamework/Happiness/ACHappCat.json
- Needs Config:
  - Server/Tamework/Needs/ACNeedsCat.json
- Breeding Config:
  - Server/Tamework/Breeding/ACBreedCat.json
- Trait Config:
  - Server/Tamework/Traits/ACTraitsCat.json
- Attachment Migration Config:
  - Server/Tamework/AttachmentMigrations/ACAttachmentMigrationCatEyesPre190.json


## Want More?
If you're interested in bringing the same mechanics to vanilla mobs in Hytale, check out my new mod:

  [![Animal Husbandry](https://img.shields.io/curseforge/dt/1480275?label=Alec%27s%20Animal%20Husbandry&style=for-the-badge&logo=curseforge&color=rgb(241%2C100%2C54))](https://legacy.curseforge.com/hytale/mods/alecs-animal-husbandry)

If you're a modder interested in adding these mechanics to **your** NPCs, check out my comprehensive taming framework built specifically for modders to integrate my systems with their mods. By referencing Tamework, you can add complex systems to your NPCs **without writing any Java code** at all:

  [![Tamework](https://img.shields.io/curseforge/dt/1447962?label=Alec%27s%20Tamework&style=for-the-badge&logo=curseforge&color=rgb(241%2C100%2C54))](https://www.curseforge.com/hytale/mods/alecs-tamework)

## Known Issues
- Some wake/laydown animation transitions are still placeholder quality and will be improved.

## Issue Reporting
If you run into issues, please report them here:
- https://github.com/Alechilles/AlecsCats/issues/new

