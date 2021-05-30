
### ポインタを動かしながらサブループ(文字列とパターンの比較)を行う

# String位置 i = #pointer_string
# Pattern位置 j = #pointer_pattern
scoreboard players operation #pointer_string Flag = #pointer_start Flag
scoreboard players operation #pointer_pattern Flag = #pattern_length Flag

# String と Patternの比較
execute unless entity @s[tag=Found] run function ocarina:boyer_moore/main_sub

# #pointer_pattern < 0 の場合，一致文字列あり
execute if score #pointer_pattern Flag matches ..-1 run tag @s add Found

# 不一致(#pointer_pattern >= 0) の場合，ずらし表に応じて #pointer_start をずらして繰り返す
execute unless entity @s[tag=Found] run execute as @e[type=armor_stand,tag=OcarinaNote] if score @s Timer = #pointer_string Flag run function ocarina:boyer_moore/zurasi

# #pointer_start < String長 の場合ループ続行
execute unless entity @s[tag=Found] if score #pointer_start Flag < #ocarina_count Flag run function ocarina:boyer_moore/main