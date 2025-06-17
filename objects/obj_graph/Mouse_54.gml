if(!message && !drag)
{
	show_menu = true;
	selected = noone;
	line = false;
	dir = false;
	drag = false;
	objdrag = noone;
	vertexsetdata = noone;
	xmenu = mouse_x;
	ymenu = mouse_y;
	with(obj_vertex)
	{
		canSelect = true;
		var mx = mouse_x;
		var my = mouse_y;
		if((mx >= x - ewidth) && mx <= (x + ewidth)
		&& (my > y - eheight) && my < (y + eheight))
		{
			if(canSelect)
			{
				with(obj_vertex)
				{
					canSelect = false;	
				}
				obj_graph.selected = self;
			}
		}
	}
	if(selected == noone)
	{
		hmenu = hoption * 4;
	}
	else
	{
		if(ds_list_size(selected.adjacents) > 0)
		{
			hmenu = hoption * 4;
			connected = true;
		}
		else
		{
			hmenu = hoption * 3;
		}
	}
	var xc = camera_get_view_x(camera);
	var yc = camera_get_view_y(camera);
	
	if(xmenu > xc + camera_get_view_width(camera) - wmenu)
	{
		xmenu = xc + camera_get_view_width(camera) - wmenu;
	}
	if(ymenu > yc + camera_get_view_height(camera) - hmenu)
	{
		ymenu = yc + camera_get_view_height(camera) - hmenu;
	}
	cursor_sprite = spr_cursor_arrow;
}