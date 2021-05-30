
# 嵐の歌
# Sneak S W Sneak S W
scoreboard players set #pattern_id Flag 1

# 文字長-1
scoreboard players set #pattern_length Flag 5

# パターン用防具立て召喚
# Timer:配列番号
# W:0 A:1 S:2 D:3 Sneak:4
summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:0,Tags:["OcarinaPattern","ScoreTarget"],DisabledSlots:1052688,ArmorItems:[{},{},{},{}]}
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run scoreboard players set @s Timer 0
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run scoreboard players set @s Flag 4
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run tag @s remove ScoreTarget
summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:0,Tags:["OcarinaPattern","ScoreTarget"],DisabledSlots:1052688,ArmorItems:[{},{},{},{}]}
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run scoreboard players set @s Timer 1
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run scoreboard players set @s Flag 2
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run tag @s remove ScoreTarget
summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:0,Tags:["OcarinaPattern","ScoreTarget"],DisabledSlots:1052688,ArmorItems:[{},{},{},{}]}
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run scoreboard players set @s Timer 2
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run scoreboard players set @s Flag 0
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run tag @s remove ScoreTarget
summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:0,Tags:["OcarinaPattern","ScoreTarget"],DisabledSlots:1052688,ArmorItems:[{},{},{},{}]}
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run scoreboard players set @s Timer 3
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run scoreboard players set @s Flag 4
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run tag @s remove ScoreTarget
summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:0,Tags:["OcarinaPattern","ScoreTarget"],DisabledSlots:1052688,ArmorItems:[{},{},{},{}]}
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run scoreboard players set @s Timer 4
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run scoreboard players set @s Flag 2
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run tag @s remove ScoreTarget
summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:0,Tags:["OcarinaPattern","ScoreTarget"],DisabledSlots:1052688,ArmorItems:[{},{},{},{}]}
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run scoreboard players set @s Timer 5
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run scoreboard players set @s Flag 0
execute as @e[type=armor_stand,tag=OcarinaPattern,tag=ScoreTarget] run tag @s remove ScoreTarget

# 比較開始位置決定
scoreboard players operation #pointer_start Flag = #pattern_length Flag
# 現在の防具立て数
execute store result score #ocarina_count Flag run execute if entity @e[type=armor_stand,tag=OcarinaNote]

# 判定開始
function ocarina:boyer_moore/main

# パターンに一致した場合の処理
execute if entity @s[tag=Found] as @a[tag=UsingFlute] run function ocarina:music/start/arasi

# 終了
tag @s remove Found
kill @e[tag=OcarinaPattern]