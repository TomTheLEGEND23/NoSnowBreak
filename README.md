# NoSnowBreak

A Minecraft 1.20.1 datapack that prevents snow from breaking fragile modded blocks.

## Problem

During snowfall (or when snow golems are present), snow layers accumulate on top of blocks.
Some modded blocks — like Refined Storage cables, Mekanism cables, and Create catwalk
railings — are sensitive to block-update events triggered when snow is placed above them,
causing them to pop off and drop as items.

## Solution

This datapack runs a scan function every second (20 ticks) around each online player.
Whenever a snow layer is detected directly on top of a fragile block it is immediately
removed, preventing the block-update chain that would otherwise break the fragile block.

## Supported fragile blocks (out of the box)

| Mod | Block |
|-----|-------|
| Refined Storage | `refinedstorage:cable` |
| Mekanism | `mekanism:universal_cable` |
| Create | `create:catwalk` |
| Create | `create:metal_railing` |

### Adding more fragile blocks

Edit (or override in your own datapack) the block tag:

```
data/nosnowbreak/tags/blocks/fragile_blocks.json
```

Add any block ID to the `"values"` list and the datapack will protect those blocks too.

## Installation

1. Download or clone this repository.
2. Copy the entire folder into the `datapacks/` directory of your Minecraft world:
   ```
   .minecraft/saves/<your-world>/datapacks/NoSnowBreak/
   ```
3. In-game, run `/reload` (or restart the world) to load the datapack.
4. You should see the confirmation message:
   ```
   [NoSnowBreak] Datapack loaded! Snow will no longer break fragile blocks.
   ```

## Compatibility

- Minecraft **1.20.1** (Java Edition) — datapack format **15**
- Works alongside any mod loader (Forge, Fabric, NeoForge)

## How it works

| File | Purpose |
|------|---------|
| `pack.mcmeta` | Declares the datapack and its format version |
| `data/minecraft/tags/functions/load.json` | Hooks into `#minecraft:load` to run initialisation on world load |
| `data/minecraft/tags/functions/tick.json` | Hooks into `#minecraft:tick` to run every game tick |
| `data/nosnowbreak/functions/load.mcfunction` | Creates the timer scoreboard and prints the load message |
| `data/nosnowbreak/functions/tick.mcfunction` | Increments a 20-tick timer; calls `scan` once per second |
| `data/nosnowbreak/functions/scan.mcfunction` | Checks a 9×9×3 area around each player and removes snow above fragile blocks |
| `data/nosnowbreak/tags/blocks/fragile_blocks.json` | Defines which blocks are considered fragile |
