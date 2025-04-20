global.curropt = 0
lastitem = 1
active = 0
alarm[0] = 5
continue_str = get_text("GameOver", "Continue")
exit_str = get_text("GameOver", "Exit")
if (global.lavastate <= 10)
    spectate_str = "Respawn"
else
    spectate_str = "Spectate"
event_user(0)
