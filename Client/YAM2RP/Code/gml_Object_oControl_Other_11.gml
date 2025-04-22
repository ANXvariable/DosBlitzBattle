var kilBfr;
if (global.playerhealth <= 0 && global.saxmode && global.sax && oCharacter.sprite_index != sCoreXSAX)
    global.playerhealth = 1
if (global.playerhealth >= 0 && global.sax && global.saxmode)
    exit
if (instance_exists(oClient) && oClient.connected)
{
    global.currX = oCharacter.x
    global.currY = oCharacter.y
    with (oClient)
        event_user(9)
}
with (oCharacter)
{
    x -= view_xview[0]
    y -= view_yview[0]
    visible = false
}
view_xview[0] = 0
view_yview[0] = 0
mus_current_fadeout()
sfx_stop_all()
sfx_play(sndPlayerDeath)
global.vibL = 0
global.vibR = 0
global.ingame = 0
global.darkness = 0
global.gotolog = -1
global.transitiontype = 3
if (global.saxmode && (!global.sax))
    global.spectatorOption = 1
if (global.spectatorOption && global.lobbyLocked)
{
    if (global.lavastate <= 10)
        global.spectator = 0
    else
        global.spectator = 1
    global.spectatorIndex = -1
}
if global.saxmode
{
    global.mapposx = 2
    global.mapposy = 2
}
if (instance_exists(oClient) && global.saxmode)
{
    kilBfr = buffer_create(1024, buffer_grow, 1)
    buffer_seek(kilBfr, buffer_seek_start, 0)
    buffer_write(kilBfr, buffer_s32, 18)
    buffer_write(kilBfr, buffer_u8, 72)
    buffer_poke(kilBfr, 0, buffer_s32, (buffer_tell(kilBfr) - 4))
    network_send_packet(oClient.socket, kilBfr, buffer_tell(kilBfr))
    buffer_delete(kilBfr)
}
event_user(3)
room_goto(rm_death)
