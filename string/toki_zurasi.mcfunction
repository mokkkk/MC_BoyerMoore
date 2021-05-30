
# ずらし表
execute if score @s Flag matches 3 run scoreboard players set #pointer_shift Flag 2
execute if score @s Flag matches 4 run scoreboard players set #pointer_shift Flag 1
execute if score @s Flag matches 2 run scoreboard players set #pointer_shift Flag 1
execute if score @s Flag matches 0 run scoreboard players set #pointer_shift Flag 6
execute if score @s Flag matches 1 run scoreboard players set #pointer_shift Flag 6