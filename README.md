# NoSnowBreak

A Minecraft **1.20.1** datapack that stops snow from breaking fragile modded blocks.

## Why?

Snow layers (from snowfall or snow golems) send a block-update when they land.
Thin modded blocks — cables, pipes, catwalks, railings — can't survive that update and
pop off as items.

This datapack uses two layers of protection:

1. **Proactive (primary):** All known fragile modded blocks are appended to the vanilla
   `#minecraft:snow_layer_cannot_survive_on` tag so Minecraft's own snow-placement logic
   refuses to place a snow layer on them at all — no block-update is ever fired.
2. **Reactive (secondary):** A per-second scan still removes any stray snow layer found
   directly above a fragile block, as a safety net for edge cases (e.g. snow placed
   by command or by a mod that bypasses the normal placement check).

## Installation

Download the latest `NoSnowBreak-V*.zip` from the [Releases](../../releases/latest) page and drop it straight into your world's `datapacks/` directory — no extraction needed:

```
saves/<world>/datapacks/NoSnowBreak-V1.0.0.zip
```

Then run `/reload` in-game. You'll see a confirmation in chat.

Alternatively, clone or copy the unzipped folder there instead — both work.

## How coverage works

Rather than requiring a long manual list, protection is layered:

**1. Vanilla non-solid blocks — automatic, no config needed**  
All modded fragile blocks (cables, pipes, catwalks) are appended to the vanilla
`#minecraft:snow_layer_cannot_survive_on` tag, which Mojang's snow-placement code
consults every time snow tries to land. This prevents snow from ever placing on these
blocks, so no block-update is triggered and nothing breaks. Vanilla non-solid blocks
(fences, glass panes, iron bars, walls, rails, chains, etc.) are already in this tag,
so they are protected automatically.

**2. Common mod convention tags — automatic when mods use them**  
The sub-tags pull in `#forge:cables`, `#c:cables`, `#forge:pipes`, `#c:pipes`, and
`#forge:platforms` / `#c:platforms` as **optional** references. Any mod that registers
its blocks to these convention tags gets protected automatically — no editing required.

**3. Known mod blocks — explicit fallback**  
For mods that don't use convention tags, specific block IDs are listed in three sub-tags:

| Tag | Coverage |
|-----|----------|
| `#nosnowbreak:cables` | Refined Storage, AE2, Mekanism, XNet |
| `#nosnowbreak:pipes` | Mekanism tubes/transporters, Thermal Series fluxducts |
| `#nosnowbreak:catwalks` | Create catwalk/railing, Immersive Engineering scaffolding |

**4. Per-second scan — safety net**  
`#nosnowbreak:fragile_blocks` (which includes `#minecraft:snow_layer_cannot_survive_on`
plus all three sub-tags above) is scanned every second. Any snow layer found directly
above a listed block is removed as a fallback for edge cases such as snow placed by
command or by mods that bypass the normal placement check.

### Adding a block that isn't covered

Add the block ID to one of the three sub-tag JSON files (`cables.json`, `pipes.json`, or `catwalks.json`):

```json
{
  "values": [
    "yourmod:your_block"
  ]
}
```

Adding to a sub-tag ensures the block gets **both** layers of protection: it is included in `#minecraft:snow_layer_cannot_survive_on` (proactive — snow won't place on it at all) and in `#nosnowbreak:fragile_blocks` (reactive — the per-second scan will also remove stray snow above it).

> **Note:** Adding a block directly to `fragile_blocks.json` only covers it with the reactive per-second scan. It will **not** receive proactive protection because `snow_layer_cannot_survive_on.json` references the three sub-tags, not `fragile_blocks.json` directly.

No other changes are needed.

## Compatibility

- Minecraft **1.20.1** — pack format **15**  
- Works with any mod loader (Forge, Fabric, NeoForge)
