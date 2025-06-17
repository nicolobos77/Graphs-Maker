msx = event_data[? "posX"];
msy = event_data[? "posY"];
if(instance_exists(obj_vertex))
{
	if(!message && !show_menu)
	{
		with(obj_vertex)
		{
			canDrag = true;
			if((obj_graph.msx >= x - ewidth) && obj_graph.msx <= (x + ewidth)
				&& (obj_graph.msy > y - eheight) && obj_graph.msy < (y + eheight))
			{
				if(canDrag)
				{
					with(obj_vertex)
					{
						canDrag = false;	
					}
					obj_graph.dx = obj_graph.msx - x;
					obj_graph.dy = obj_graph.msy - y;
					obj_graph.drag = true;
					obj_graph.objdrag = self;
				}
			}
		}
	}	
}
if(objdrag == noone)
{
	drag = true;
	dx = msx - camera_get_view_x(camera);
	dy = msy - camera_get_view_y(camera);
}
cursor_sprite = spr_cursor_drag;