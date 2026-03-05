# NoSnowBreak - Initialisation
# Remove-then-add avoids "already exists" log spam on repeated /reload
# (The remove will fail silently on first install, which is harmless)

scoreboard objectives remove nosnowbreak.timer
scoreboard objectives add nosnowbreak.timer dummy
scoreboard players set #timer nosnowbreak.timer 0
tellraw @a [{"text":"[NoSnowBreak] ","color":"aqua"},{"text":"Datapack loaded! Snow will no longer break fragile blocks.","color":"green"}]
