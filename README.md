# NoSnowBreak

A Minecraft **1.20.1** datapack that stops snow from breaking fragile modded blocks.

## Why?

Snow layers (from snowfall or snow golems) send a block-update when they land.
Thin modded blocks — cables, pipes, catwalks, railings — can't survive that update and
pop off as items. This datapack detects and removes the snow layer before the update
propagates.

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
`#nosnowbreak:fragile_blocks` includes `#minecraft:snow_layer_cannot_survive_on`, the
official Mojang tag for every block that can't hold a snow layer (fences, glass panes,
iron bars, walls, rails, chains, etc.). All of these are protected out of the box, and
Mojang keeps this tag up to date across game versions.

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

### Adding a block that isn't covered

Edit the relevant sub-tag JSON (or `fragile_blocks.json` directly) and add the block ID:

```json
{
  "values": [
    "yourmod:your_block"
  ]
}
```

No other changes are needed.

## Compatibility

- Minecraft **1.20.1** — pack format **15**  
- Works with any mod loader (Forge, Fabric, NeoForge)
