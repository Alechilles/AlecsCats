<p>
    <a href="https://www.curseforge.com/hytale/mods/alecs-tamework" target="_blank" rel="noopener noreferrer"><img alt="Tamework downloads" src="https://img.shields.io/curseforge/dt/1447962?label=Tamework&amp;style=for-the-badge&amp;logo=curseforge&amp;color=rgb(241%2C100%2C54)" /></a>
    <a href="https://www.curseforge.com/hytale/mods/alecs-cats" target="_blank" rel="noopener noreferrer"><img alt="Cats downloads" src="https://img.shields.io/curseforge/dt/1432112?label=Cats&amp;style=for-the-badge&amp;logo=curseforge&amp;color=rgb(241%2C100%2C54)" /></a>
    <a href="https://www.curseforge.com/hytale/mods/alecs-nametags" target="_blank" rel="noopener noreferrer"><img alt="Nametags downloads" src="https://img.shields.io/curseforge/dt/1464844?label=Nametags&amp;style=for-the-badge&amp;logo=curseforge&amp;color=rgb(241%2C100%2C54)" /></a>
    <a href="https://www.curseforge.com/hytale/mods/alecs-animal-husbandry" target="_blank" rel="noopener noreferrer"><img alt="Animal Husbandry downloads" src="https://img.shields.io/curseforge/dt/1480275?label=Animal%20Husbandry&amp;style=for-the-badge&amp;logo=curseforge&amp;color=rgb(241%2C100%2C54)" /></a>
  </p>
  <p>
    <a href="https://discord.gg/E8n8RgTTdq" target="_blank" rel="noopener noreferrer"><img alt="Join Discord" src="https://img.shields.io/discord/1468261809739005996?style=for-the-badge&amp;logo=discord&amp;logoColor=white&amp;label=Join%20Discord&amp;color=rgb(88,101,242)" /></a>
    <a href="https://ko-fi.com/alechilles" target="_blank" rel="noopener noreferrer"><img alt="Support me on Ko-fi" src="https://img.shields.io/badge/ko--fi-Support%20Me-ff5f5f?logo=ko-fi&amp;style=for-the-badge" /></a>
    <a href="https://hytale.com/" target="_blank" rel="noopener noreferrer"><img alt="Creator Code Alec" src="https://img.shields.io/badge/Creator%20Code-Alec-00AEEF?style=for-the-badge" /></a>
    <a href="https://twitter.com/intent/user?screen_name=Alechilles" target="_blank" rel="noopener noreferrer"><img alt="Follow Alec on X" src="https://img.shields.io/badge/Follow-%40Alec-White?style=for-the-badge&amp;logo=x&amp;logoColor=rgb(255%2C255%2C255)&amp;logoSize=auto&amp;label=Follow&amp;labelColor=rgb(85%2C85%2C85)&amp;color=rgb(147%2C147%2C147)" /></a>
  </p>
  <p>
    <a href="https://bisecthosting.com/Alec" target="_blank"><img alt="25% Off BisectHosting Servers With Code: Alec" src="https://www.bisecthosting.com/partners/custom-banners/249bd432-0996-4ccb-8184-65cd3791a3d2.webp" /></a>
  </p>
  <p>
    <a href="https://hytalemodding.dev/en/grants" target="_blank" rel="noopener noreferrer"><img alt="Sponsored by HytaleModding Grant Program" src="https://github.com/user-attachments/assets/a03709e3-445a-4e58-8ec5-591688490c5d" /></a>
  </p>

## Summary
This mod started as a simple cat conversion from unused base-game assets and has grown into a full pet system with:
- Taming + ownership
- Capture/spawn with persistent appearance variants
- Command controls (Follow, Hold, Recall, Move To Ping, Set Home, Return Home, Attack Target)
- Happiness/needs simulation with resource seeking
- Passive companion breeding
- Trait generation and inheritance for bred companion cats
- Multi-language localization

--------------
<H2>Required:</H2>
<ul>
<li><a href="https://www.curseforge.com/hytale/mods/alecs-tamework">Alec's Tamework!</a> 2.14.x</li>
</ul>
<H2>Recommended:</H2>
<ul>
<li><a href="https://www.curseforge.com/hytale/mods/alecs-nametags">Alec's Nametags!</a></li>
<li><a href="https://www.curseforge.com/hytale/mods/alecs-animal-husbandry">Alec's Animal Husbandry!</a></li>
<li><a href="https://www.curseforge.com/hytale/mods/mmo-skill-tree-taming-skill-pack-alecs-tamework">Taming Addon for MMO Skills</a></li>
</ul>
------------

## Craftable Items
### Cat Collar (Capture/Spawn Item)
- 3x Light Leather
- 1x Gold Bar
- Bench: Workbench Tier 2 (Tinkering)
- Stored cats use generated collar icons that match their body type and coat.

### Cat Treat Bag (Command Item)
- 2x Light Leather
- 5x Raw Fish
- 5x Raw Meat
- Bench: Workbench Tier 2 (Tinkering)

### Cat Cardboard Box
- 10x Plant Fiber
- 5x Catnip Plant
- Bench: Workbench Tier 2 (Tinkering)

### Large Cat Cardboard Box
- 20x Plant Fiber
- 10x Catnip Plant
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
- Cat breeding uses Tamework gender support, so compatible breeding pairs must be different genders when that Tamework setting is enabled

## Spawns
Cats are uncommon but not extremely rare.
- Mediumhair: Zone 1 Plains and Forests
- Shorthair: Zone 2 Oasis, Plateau, and Savanna
- Bobtail: Zone 1 Mountains, Zone 2 Plateau, and Zone 3 Mountains
- Longhair: Zone 3 Forests and Tundra

They usually spawn solo, but can spawn in small groups.

## 1,216 Appearance Variations
#### _All cat textures are now made by an artist far more skilled than me, [Celly (@Excel Lynt)](https://www.curseforge.com/members/excel_lynt/)._

Appearance combines body type, coat, and eyes. Eye colors are separate randomized attachments, so cats can inherit eyes independently from coat color.

| Category | Count | Variants |
| --- | ---: | --- |
| Body types | 4 | Mediumhair<br>Longhair<br>Shorthair<br>Bobtail |
| Coats | 19 | Black and White<br>Gray<br>Light Gray<br>Silver Tabby<br>Orange Tabby<br>Brown Tabby<br>White<br>Cream<br>Cream Tuxedo<br>Gray Tuxedo<br>Brown Tuxedo<br>Light Orange Tabby Tuxedo<br>Black Tuxedo<br>Black<br>Snowshoe<br>Sand Tabby<br>Dark Gray Tabby<br>Chocolate Point<br>Blue Point |
| Eyes | 16 | Bright Orange<br>Bright Yellow<br>Dark Orange<br>Forest Green<br>Green<br>Hazel<br>Ice Blue<br>Light Blue<br>Blue and Green-Yellow (Rare)<br>Blue and Green (Rare)<br>Orange and Yellow (Rare)<br>Yellow and Green (Rare)<br>Pumpkin Orange<br>Teal<br>Yellow-Lime<br>Yellow |

Total combinations: 4 body types x 19 coats x 16 eye variants = 1,216 appearance variations.

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
- Attachment Display Config:
  - Server/Tamework/AttachmentDisplays/ACAttachmentDisplayCat.json


## Want More?
If you're interested in bringing the same mechanics to vanilla mobs in Hytale, check out:

  [![Animal Husbandry](https://img.shields.io/curseforge/dt/1480275?label=Alec%27s%20Animal%20Husbandry&style=for-the-badge&logo=curseforge&color=rgb(241%2C100%2C54))](https://legacy.curseforge.com/hytale/mods/alecs-animal-husbandry)

If you're a modder interested in adding these mechanics to **your** NPCs, check out my comprehensive taming framework built specifically for modders to integrate my systems with their mods. By referencing Tamework, you can add complex systems to your NPCs **without writing any Java code** at all:

  [![Tamework](https://img.shields.io/curseforge/dt/1447962?label=Alec%27s%20Tamework&style=for-the-badge&logo=curseforge&color=rgb(241%2C100%2C54))](https://www.curseforge.com/hytale/mods/alecs-tamework)

## Known Issues
- Some wake/laydown animation transitions are still placeholder quality and will be improved.

## Issue Reporting
If you run into issues, please report them here:
- https://github.com/Alechilles/AlecsCats/issues/new

<H2>Telemetry</H2>
<p><a href="https://www.curseforge.com/hytale/mods/alecs-tamework">Alec's Tamework</a>, and thus Alec's Cats, utilizes <a href="https://www.curseforge.com/hytale/mods/alecs-telemetry">Alec's Telemetry</a> to report crash, error, performance, and usage telemetry data to the developer.</p>
<p>This data is anonymous and does <strong>not</strong> contain any personally identifiable information, and is exclusively used to diagnose issues in the mod to provide a better user experience.</p>
<p>You may disable this feature at any time in the `/tw settings` menu in the Telemetry section.</p>
<p>Alec's Tamework also reports anonymized active user numbers to <a href="https://hstats.dev/">HStats</a> to track active user count summaries.</p>
<br />