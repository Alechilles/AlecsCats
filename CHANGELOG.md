# Changelog

All notable changes to **Alec's Cats!** will be documented in this file.

## 1.9.0 - Body Types + Eye Variants - 2026-05-13

### Added
- Wired mediumhair, longhair, shorthair, and bobtail cat body roles into Tamework companion, interaction, command, spawner, needs, happiness, trait, and breeding configs.
- Cat breeding now uses Tamework parent-line role inheritance so offspring can inherit either parent's body role, with a rare body-role mutation chance.
- Added separate randomized eye attachments for cat appearances.
- Added a new orange-yellow odd-eye variant.
- Added a Tamework attachment migration config that maps pre-1.9.0 coat selections to matching original eyes for existing cats.

### Changed
- Updated the required Alec's Tamework dependency to `2.10.x` for parent-line breeding role inheritance and attachment migration support.
- Cat breeding can now inherit eye selections from parents independently from coat selections.
- Defined body-type-specific coat and eye weighting for shorthair and bobtail cats.
- Updated wild cat spawn distribution so shorthair and bobtail body types appear in matching world regions.
- Updated `manifest.json` version to `1.9.0`.

## 1.8.2 - Carnivore Kibble + Sit Transition Cleanup - 2026-04-20

### Changed
- Pet cats now accept Tamework Carnivore Kibble for hand-feeding and nearby-container hunger refills, with the same generic-feed happiness penalty used for Animal Husbandry predators.
- Updated the required Alec's Tamework dependency to `2.8.x` to match Carnivore Kibble support.
- Updated `manifest.json` version to `1.8.2`.

### Fixed
- Pet cats now clear their wander sit posture before command-driven follow/defend/move transitions so interrupted idle sits no longer slide across the ground.

## 1.8.1 - Spawner Icon Correction - 2026-04-13
### Fixed
- Replaced the four newly added coat override spawner icons with proper generated icon assets for Snowshoe, Cream Semi-Tabby, Dark Gray Tabby, and Siamese.

### Changed
- Updated `manifest.json` version to `1.8.1`.

## 1.8.0 - Additional Coat Variants - 2026-04-12
### Added
- Added four new cat appearance variants: Snowshoe, Cream Semi-Tabby, Dark Gray Tabby, and Siamese.
- Added generated coat icons for the new variants so captured/spawned cats keep distinct item visuals.

### Changed
- Updated `Server/Models/Pets/Cat/Cat.json` and `Server/Tamework/Items/Spawners/ACSpawnCat.json` to include the new coat mappings.
- Updated `manifest.json` version to `1.8.0`.

## 1.7.2 - Catfood Art + Config ID Refactor - 2026-04-02
### Added
- Added `Common/Items/Catfood_Texture.png` and a dedicated generated icon (`Icons/ItemsGenerated/AlecsCats_Command_Item.png`) for the Cat Treat Bag.

### Changed
- Renamed cats Tamework config assets from legacy `Tw*`/`AlecsCats_*` names to `AC*` filenames (`ACInt*`, `ACNeeds*`, `ACHapp*`, `ACTraits*`, `ACBreed*`, `ACComp*`, `ACComm*`).
- Renamed the cat spawner config asset from `AlecsCats_Spawner_Cat` to `ACSpawnCat`, keeping the coat-override spawner mapping for both `Cat` and `Cat_Pet`.
- Updated cat spawner and command item assets to use the new generated coat icon set and removed superseded legacy cat/spawner icon files.
- Tuned item quality and item descriptions for the Cat Treat Bag and Cat Soul Lantern items across localized language packs.
- Updated `manifest.json` version to `1.7.2`.

## 1.7.1 - Celly Variant Pack III - 2026-03-29
### Added
- Added new Black cat, updated Gray Tuxedo, and refreshed Nyxie and Missy appearance variants contributed by Celly(@Excel_Lynt)

### Changed
- Updated `manifest.json` version to `1.7.1`.

## 1.7.0 - Celly Variant Pack II - 2026-03-28
### Added
- Added five new cat appearance variants created by Celly(@Excel_Lynt): Cream, Cream Tuxedo, Gray Tuxedo, Brown Tuxedo, and Light Orange Tabby Tuxedo.

### Changed
- Updated `manifest.json` version to `1.7.0`.

## 1.6.3 - Manual Breed Interaction + Update 4 Compatibility - 2026-03-26
### Added
- Added a dedicated crouch + attractive-item breeding interaction to `AlecsCats_Cat_InteractionConfig`, including item consumption and `Hearts_Subtle` feedback.

### Changed
- Updated `manifest.json` version to `1.6.3`.
- Updated release compatibility metadata to `ServerVersion`/`gameVersions` `2026.03.26-89796e57b`.

## 1.6.2 - Pet Interaction + Attraction Param Alignment - 2026-03-20
### Added
- Added a dedicated pet interaction for `Cat_Pet` when the player has an empty hand and the pet cooldown alarm is unset.
- Added `TwHook_Pet` handling in `Template_Cat_Pet` to trigger pet feedback and set `Pet_Ready`.

### Changed
- Standardized cat food parameter naming from `LovedItems` to `AttractiveItemSet` across cat templates/mobs and interaction references.
- Updated cat feed item tuning in `AlecsCats_Cat_InteractionConfig` (raw fish, wildmeat, chicken with adjusted heal values).
- Added `CooldownSeconds: 1` to the pet custom interaction to reduce rapid repeat triggering.
- Added `TooltipMode: "Additive"` to `AlecsCats_Spawner_Cat`.
- Updated temp cat conversion tame config to read `ItemsParam: "AttractiveItemSet"`.

### Fixed
- Petting no longer leaves cats stuck in looping `Alerted` status animation.

## 1.6.1 - Multi-Texture Variant Pack By Celly(@Excel_Lynt) - 2026-03-18
### Added
- Added four new cat appearance variants created by Celly(@Excel_Lynt): Silver Tabby, Orange Tabby, Brown Tabby, and White.
- Added per-variant cat spawner item icons for both `Cat` and `Cat_Pet` coats (Empty, Missy, Nyxie, SilverTabby, OrangeTabby, BrownTabby, White).

### Changed
- Updated `Cat` model variant texture mappings to load all new variant textures from `Common/NPC/Pets/Cat/Models/Celly(Excel_Lynt)/`.

## 1.6.0 - Silver Tabby - 2026-03-18
### Added
- New Silver Tabby Cat skin created by Excel Lynt has been added

## 1.5.7 - Sleep Wake Origin + Breeding Cooldown Format - 2026-03-14
### Changed
- `Template_Cat_Pet` sleep wake routing now preserves sleep origin: waking returns to `Idle` when sleep started from idle/follow, and returns to `Hold` when sleep started from hold.
- `TwBreedingConfig_AlecsCats_Cat_Pet` now uses `Cooldowns.BaseCooldownMinutes` (instead of seconds) for clearer cooldown tuning, matching the newer Tamework breeding config format.

## 1.5.6 - UpdateChecker + Docs Polish - 2026-03-11
### Added
- Added CurseForge update-check metadata in `manifest.json` (`UpdateChecker.CurseForge = 1432112`) so supported clients can detect newer versions.

### Changed
- Updated `manifest.json` version to `1.5.6`.
- Improved README content clarity and refreshed project shields/badges.

## 1.5.5 - Release Prep Patch - 2026-03-08
### Changed
- Updated `manifest.json` version to `1.5.5`.

## 1.5.4 - Tamework 2.2 Release Alignment - 2026-03-07
### Changed
- Updated `manifest.json` version to `1.5.4`.
- Updated required Tamework dependency to `Alechilles:Alec's Tamework! = 2.2.x`.

### Fixed
- Ensured `manifest.json` `ServerVersion` remains lowercase format for compatibility.

## 1.5.3 - Spawner Left/Right Click - 2026-03-02
### Added
- New cats-scoped Tamework configs for happiness, needs, and breeding:
  - `Server/Tamework/Happiness/TwHappinessConfig_AlecsCats_Cat_Pet.json`
  - `Server/Tamework/Needs/TwNeedsConfig_AlecsCats_Cat_Pet.json`
  - `Server/Tamework/Breeding/TwBreedingConfig_AlecsCats_Cat_Pet.json`
- New cats-scoped trait config:
  - `Server/Tamework/Traits/TwTraitConfig_AlecsCats_Cat_Pet.json`

### Changed
- Cats can now be captured and spawned with both left and right click
- `Template_Cat_Pet` now integrates Tamework needs-seek sensor/action behavior (`NeedsSeekWater`, `NeedsSeekFood`) and breeding pair movement (`BreedPair`) states.
- Added state-transition cleanup so status animations are cleared when moving between hold/sleep/needs and locomotion states.
- `Cat_Pet` now defines flock compatibility (`FlockArray: ["Cat_Pet"]`) so breeding family flocks can form for companion cats.

### Fixed
- `ServerVersion` format in `manifest.json` (Must be lower case)

## 1.5.2 - Cat Wander + Ambient Behavior Polish - 2026-02-23
### Changed
- `Template_Cat_Pet` now uses `Component_Tamework_Instruction_Wander` in `Idle` state, causing pet cats to wander within the template's `WanderRadius`.
- Follow behavior is restored as an explicit `Follow` state using `Component_Tamework_Instruction_Follow_Advanced`; interaction mode cycling, taming state assignment, and command-item `Follow`/`Recall` flows now route to `Follow` instead of `Idle`.
- `Template_Cat_Pet` now maps Hold posture/flavor/sleep parameters into Wander settle behavior, allowing cats to occasionally sit, play flavor idles, and sleep while in wander mode.
- `Template_Cat_Pet` now maps a Wander settle-exit transition (`StandUp` with delay) to avoid cats sliding while still in sit posture when resuming movement.
- Hold posture timing defaults are tuned (`SleepDelayAfterHoldEnterRange`, `SleepDelayAfterLastSleepRange`, `HoldStillWeight`, `HoldStillDurationRange`) so cats spend longer settled between flavor idles.

## 1.5.1 - Cat Treat Bag Crafting Fix - 2026-02-19
### Fixed
- Cat Treat Bag can now be crafted from Tier 2 Workbench

## 1.5.0 - Command Item System + Update 3.1 Compatibility - 2026-02-19
### Added
- New `AlecsCats_Command_Item` (Cat Treat Bag) command tool using Tamework's command system.
- `TwCommandItemConfig` for cats with commands: `Follow`, `Hold`, `Recall`, `Move To Ping`, `Set Home`, `Return Home`, and `Attack Target`.
- Command-item localization keys (`items.AlecsCats_Command_Item.*`) across all supported locales.

### Changed
- `Template_Cat_Pet` now includes `Component_Tamework_Instruction_Command_Move` so command move/home hooks can drive movement behavior.
- Cat command flow now uses Tamework command selection/dispatch pipeline (including radial menu selection and linked-NPC command routing).

### Fixed
- Added missing non-English command-item language lines in locale `server.lang` files.
- Updated manifest `ServerVersion` to `2026.02.19-1A311A592` for latest server compatibility.

## 1.4.3 - Hytale Update 3 Compatibility - 2026-02-17
### Fixed
- Updated manifest for Hytale Update 3.

## 1.4.2 - Tamework Asset/Spawner Updates - 2026-02-15
### Added
- Tamework interaction config assets for cat interactions.
- TwSpawnerConfig asset for cat spawner items.

### Changed
- Updated cat spawner items to use the new Tamework spawner config flow.
- Updated to the latest Tamework asset system (items/particles/sounds resolved from Tamework assets pack).
- Small Lulu texture tweak.

### Removed
- Legacy Tamework_Settings.json and Tamework_Items_Config.json (use TwGlobalConfig and TwSpawnerConfig).
- Soul Lantern visual/audio assets from Alec's Cats (now sourced from Alec's Tamework assets pack).

## 1.4.1 - Tamework Integration and Capture Flow - 2026-02-07
### Changed
- Small tweaks for compatibility with new Tamework follow components.
- Slight progress on Lulu texture.

## 1.4.0 - Tamework Integration and Capture Flow - 2026-02-02
### Added
- Ownership and tamed state stored on NPCs via new Tamework components.
- Attachment preservation when capturing/spawning cats (coat variants persist).
- Damage configuration options (invulnerable to owner (default), all players, or all sources).
- Inventory icons for captured cats change dynamically to match the stored cat's appearance.

### Changed
- Taming flow now uses the new Tamework capture system.
- Interaction logic aligned with Tamework owner/tamed rules (owner-only interaction and capture).
- Merged Cat_Pet logic into Cat logic, using the new IsTamed flag from Tamework, allowing one Cat role to handle both wild and tamed behavior.
- Interaction particles/icons now come from **Alec's Tamework!** assets (client must load the Tamework assets pack).
- Per-world item config overrides load from:
  `<UserData>/Saves/<World>/mods/Alec's Cats!/Tamework_Items_Config.json` (auto-created empty; leave empty to inherit defaults).

### Notes
- Tamework settings control owner damage protection and related rules in `Alec's Cats!/Server/Tamework/`.

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
- Pet cat item being held in an odd way.

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
- Memories configured (replaced placeholders with real cat memory).

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
- Click with the cat in your hand to place it in the world.
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
- Unused cat model, texture, and animations added to the game.
- Behaviors ported from Foxes to new cat behaviors.
- Behaviors slightly changed.
- Second cat texture variant added.
- Spawns added to Plains, Forests, Autumn, and Azure.

