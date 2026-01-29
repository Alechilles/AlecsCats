
## <a id="summary">Summary</a>
This mod makes use of the existing but unused Cat model and animations in the Hytale assets. Originally I just swapped out a few values to turn a Fox into a Cat, but now I've expanded it significantly with my own taming system, animations, and textures of my own cats!

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
    *   Use the Cat Collar on the Cat to pick it up and tame it permanently
*   **Tamed Behavior:**
    *   Click with the Cat in your hand to place it in the world
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
    *   More advanced defend combat behavior
*   Componentizing the codebase to make expansion to other mobs simpler
    *   Will be branching into two mods
    *   New mod will be a taming framework that this mod will reference and will be open to integrate with other people's mods
*   Adding more variants
    *   Next is Lulu (White with gray/brown accents, like a toasted marshmallow) 
    *   If you want to see your own cat in the game, send me lots of pictures of your cat and if I can, I will try to make a texture for them in the game :)
        *   Currently in queue: Lulu (White with gray/brown accents), Piper (Tabby), Ahsoka (Torbie), Toulouse (White with faint brown highlights), Noodles (Black and white)

## <a id="future-plans">Future Plans</a>
*   Pet whistle item that commands all currently following pets to do something
*   Plugin to tie first taming player to the mob so other people can't steal it
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
*   Cat's textures are randomized upon storing and deploying
    *   This will be fixed soon, but it requires duplicating all my code, so I'm waiting till it's mostly done or I've found a way to componentize it.
    *   I made some headway towards componentizing my taming system and such, but I ran into some road blocks.
        *    Will be revisiting after I get the core functionality sorted out.
*   A few users have reported some or all of the interactions not working
    *   If you've experienced this issue, please [report it here](https://github.com/Alechilles/AlecsCats/issues/new) with as much information as possible
    *   I suspect it has something to do with some mod conflicts, but nobody who has run into the issue so far has given me any real information to work with
