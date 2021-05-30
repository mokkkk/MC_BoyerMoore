
### 文字列とパターンの比較

# タグ初期化
tag @s remove Break

# 比較用タグ
execute as @e[type=armor_stand,tag=OcarinaNote] if score @s Timer = #pointer_string Flag run tag @s add TargetStr
execute as @e[type=armor_stand,tag=OcarinaPattern] if score @s Timer = #pointer_pattern Flag run tag @s add TargetPtn

# String[i] == Pattern[j]の場合
# i--, j--
execute if score @e[tag=TargetStr,limit=1] Flag = @e[tag=TargetPtn,limit=1] Flag run tag @s add Correct
execute if entity @s[tag=Correct] run tag @s add Shifted
execute if entity @s[tag=Correct] run scoreboard players remove #pointer_string Flag 1
execute if entity @s[tag=Correct] run scoreboard players remove #pointer_pattern Flag 1
# else
# ループ脱出
execute unless entity @s[tag=Correct] run tag @s add Break

# タグ初期化
tag @s[tag=Correct] remove Correct
tag @e[tag=TargetStr] remove TargetStr
tag @e[tag=TargetPtn] remove TargetPtn

# 開始位置 < 防具立て数 & #pointer_start >= 0 & !Break の場合繰り返す(無限ループ防止)
execute unless entity @s[tag=Break] if score #pointer_start Flag < #ocarina_count Flag if score #pointer_pattern Flag matches 0.. run function ocarina:boyer_moore/main_sub