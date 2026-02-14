
## <a id="summary">Summary</a>
This mod makes use of the existing but unused Cat model and animations in the Hytale assets. Originally I just swapped out a few values to turn a Fox into a Cat, but now it's expanded with a full taming system powered by **Alec's Tamework!**, custom behaviors, and textures of my own cats (and community submissions)!


**Requires Alec's Tamework!** ([plugin](https://www.curseforge.com/hytale/mods/alecs-tamework) + [assets pack](https://legacy.curseforge.com/hytale/mods/alecs-tamework-assets)). The mod relies on Tamework components for capture, ownership, and pet interactions.

## Thank You
Thank you so much for checking out my mod! This is my first real mod and I've really enjoyed working on it and seeing so many people enjoy it. 

Please give my [GitHub repo](https://github.com/Alechilles/AlecsCats) a star if you enjoy the mod and/or found my mod helpful as a reference when building your own! <3

## Table of Contents
* [Summary](#summary)
* [Taming](#how-taming-works)
* [Spawns](#spawns)
* [Color Variants](#color-variants)
* [In-Progress](#in-progress)
* [Known Issues](#known-issues)
* [Issue Reporting](#issue-reporting)

## <a id="how-taming-works">How Taming Works</a>
*   **Taming Process:**
    *   Craft a Cat Collar at a Workbench (Tier 2, Tinkering Tab) with 3 Light Leather and 1 Gold Bar
    *   Feed a cat a piece of raw fish to make it friendly
    *   Use the Cat Collar on the Cat to capture it and tame it permanently
*   **Tamed Behavior:**
    *   Captured cats preserve their appearance (coat variants persist) when stored and re-spawned
    *   Click with the **Lantern** containing the Cat in your hand to place it in the world
    *   You will get the Collar back and can use it on the Cat again to pick it back up
    *   On placement it will stay still (default behavior so it doesn't chase you down if you left it somewhere and reloaded your game)
    *   Interact with the Cat with Raw Fish in your hand to feed the Cat and restore its health
    *   Interact with the Cat **without** Fish or a Collar in your hand to toggle modes
        *   **Follow** - Paw Print
            *    Cat will follow you closely and will not interact with mobs
        *   **Stay** - Hand
            *    Cat will stay where they are indefinitely
        *   **Defend** - Shield
            *    Cat will follow you closely and engage any nearby hostile mobs in combat

## Ownership
*   Ownership will be applied to the Cat upon taming
*   Only the original tamer will be able to interact with and store the Cat
*   When a cat is stored in an item, its ownership is cleared until it is re-spawned (enables trading)
*   By default, the owner cannot damage their own cat, but other players, NPCs, and environments can
    *   Global owner-damage rules are controlled by Alec's Tamework! `TwGlobalConfig` assets:
        *   `<Alec's Tamework!>/Server/Tamework/Global/*.json` (default `TwGlobalConfig_Default.json`)
        *   Invulnerability from owner
        *   Invulnerability from players
        *   Invulnerability from all sources

## Spawner Config
Cat spawner behavior is configured in Alec's Cats!/Server/Tamework/Items/Spawners/AlecsCats_Spawner_Cat.json (TwSpawnerConfig).

## <a id="spawns">Spawns</a>
They are fairly uncommon, but not exceedingly rare. You are meant to have to look for one, but they're not meant to be super hard to find. If you search a biome thoroughly, you should usually find one ~60% of the time. They will usually spawn alone, but can spawn in groups of up to 3.
*   **Zone 1** - Weight 4
    *   Plains
    *   Forests
*   **Zone 3** - Weight 5
    *   Forests

## <a id="color-variants">Color Variants Available</a>
*   Default black and white
*   Dark gray (Missy)
*   Light gray with a few white markings (Nyxie)

## <a id="in-progress">In-Progress</a>
*   Refining the taming system
*   Adding more variants
    *   Next is Lulu (White with gray/brown accents, like a toasted marshmallow) 
    *   If you want to see your own cat in the game, send me lots of pictures of your cat and if I can, I will try to make a texture for them in the game :)
        *   Currently in queue: Lulu (White with gray/brown accents), Piper (Tabby), Ahsoka (Torbie), Toulouse (White with faint brown highlights), Noodles (Black and white)

## <a id="future-plans">Future Plans</a>
*   Pet whistle item that commands all currently following pets to do something
*   A way to ensure spawned cats stay persistent through server cleanup
*   Rare magical variants
*   Add more animations
*   Add kittens
*   Add dogs?
*   Add other kinds of pets?

## <a id="issue-reporting">Issue Reporting</a>
If you've run into a bug or any kind of issue, please [submit a new issue](https://github.com/Alechilles/AlecsCats/issues/new) on my GitHub repo. As much information as you can possibly provide is highly appreciated!

## <a id="known-issues">Known Issues</a>
*   Wake and Laydown animations are bad
    *   They are placeholders, made hastily to replace the even worse animations I was previously using from the Fox model.
    *   I will replace these after I finish getting core functionality done.


