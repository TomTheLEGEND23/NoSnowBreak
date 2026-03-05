# NoSnowBreak - Tick
# Runs every game tick; calls the scan function once per second (every 20 ticks)

scoreboard players add #timer nosnowbreak.timer 1
execute if score #timer nosnowbreak.timer matches 20.. run function nosnowbreak:scan
execute if score #timer nosnowbreak.timer matches 20.. run scoreboard players set #timer nosnowbreak.timer 0
