
### 各文字列用のずらし表を参照し，ポインタをずらす

# 時の歌
execute if score #pattern_id Flag matches 0 run function ocarina:boyer_moore/string/toki_zurasi
# 嵐の歌
execute if score #pattern_id Flag matches 1 run function ocarina:boyer_moore/string/arasi_zurasi

# ポインタをずらす
scoreboard players operation #pointer_start Flag += #pointer_shift Flag