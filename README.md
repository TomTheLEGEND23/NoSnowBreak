# NoSnowBreak

A Minecraft **1.20.1** datapack that stops snow from breaking fragile modded blocks.

## Why?

Snow layers (from snowfall or snow golems) send a block-update when they land.
Thin modded blocks — cables, pipes, catwalks, railings — can't survive that update and
pop off as items. This datapack detects and removes the snow layer before the update
propagates.

## Installation

1. Place this folder inside your world's `datapacks/` directory:
   ```
   saves/<world>/datapacks/NoSnowBreak/
   ```
2. Run `/reload` in-game. You'll see a confirmation in chat.

## Protected blocks

Blocks are grouped into three block tags you can find under `data/nosnowbreak/tags/blocks/`:

| Tag | Included mods |
|-----|---------------|
| `#nosnowbreak:cables` | Refined Storage, Applied Energistics 2, Mekanism, XNet |
| `#nosnowbreak:pipes` | Mekanism (tubes / transporters), Thermal Series (fluxducts) |
| `#nosnowbreak:catwalks` | Create (catwalk, railing), Immersive Engineering (scaffolding) |

`#nosnowbreak:fragile_blocks` references all three tags and is what the datapack actually checks.

### Adding your own blocks

Edit the relevant sub-tag JSON (or `fragile_blocks.json` directly) and add any block ID:

```json
{
  "values": [
    "refinedstorage:cable",
    "yourmod:your_block"
  ]
}
```

No other changes are needed — the scan function picks up the tag automatically.

## Compatibility

- Minecraft **1.20.1** — pack format **15**  
- Works with any mod loader (Forge, Fabric, NeoForge)
