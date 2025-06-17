if(!message)
{
	var mx = event_data[? "posX"];
	var my = event_data[? "posY"];
	if(drag && objdrag != noone && instance_exists(objdrag))
	{
		objdrag.x = mx - dx;
		objdrag.y = my - dy;
	}
	if(drag && objdrag == noone)
	{
		camera_set_view_pos(camera,camera_get_view_x(camera) - event_data[? "diffX"],camera_get_view_y(camera) - event_data[? "diffY"]);
	}
}