draw_self()
if (alarm[0] > 0)
{
    draw_set_halign(fa_right)
    draw_text((x - 12), (y + 12), "Stats reset!")
    draw_set_halign(fa_left)
}
if (alarm[10] > 0)
{
    draw_set_halign(fa_right)
    draw_text((room_width - 16), 128, ("Server resetting in " + string(floor((alarm[10] / 60)))))
    draw_set_halign(fa_left)
}
draw_set_halign(fa_right)
draw_text((room_width - 16), 160, ((("deadList: " + string(ds_list_size(oServer.deadList))) + " samusList: ") + string(ds_list_size(oServer.samusList))))
draw_set_halign(fa_left)
