# NoSnowBreak - Initialisation
# Creates the scoreboard objective used as a tick timer

scoreboard objectives add nosnowbreak.timer dummy
scoreboard players set #timer nosnowbreak.timer 0
tellraw @a [{"text":"[NoSnowBreak] ","color":"aqua"},{"text":"Datapack loaded! Snow will no longer break fragile blocks.","color":"green"}]
