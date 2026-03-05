# NoSnowBreak - Scan
# Called once per second; iterates over each online player once and delegates
# the 9x9x3 volume position checks to nosnowbreak:scan_player.
# Fragile blocks are defined in the #nosnowbreak:fragile_blocks block tag.

execute as @a at @s run function nosnowbreak:scan_player
