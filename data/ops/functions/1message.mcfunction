##########################################
# Author: Matt S
# Date: July 31, 2019
# Version: 3.0
# Minecraft Version 1.13 / 1.14
# Description:
# Shows a single static message when a player
# goes to sleep
##########################################

# If this is during the day, then it must be a thunderstorm.
execute if score #query_time ops.sleep matches 23500..23999 run scoreboard players set #query_time ops.sleep -1
execute if score #query_time ops.sleep matches 0..12500 run scoreboard players set #query_time ops.sleep -1

execute if score #query_time ops.sleep matches -1 run tellraw @a ["",{"selector":"@s"},{"text":" blew the rain away","color":"aqua"}]
execute if score #query_time ops.sleep matches -1 run weather thunder 1

# Otherwise, show sleep message
tellraw @a ["",{"selector":"@s"},{"text":" is sleeping","color":"blue","clickEvent":{"action":"run_command","value":"/trigger ops.kickBed"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Wake up!","color":"aqua"}]}}}]
