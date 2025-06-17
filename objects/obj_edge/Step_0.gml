if(visible)
{
	if(to == noone || from == noone)
	{
		instance_destroy();	
	}
	if(!instance_exists(to))
	{
		if(instance_exists(from))
		{
			var findId = graph_find_edge_index(from,to);
			if(findId >= 0)
			{
				ds_list_delete(from.adjacents,findId);
			}
		}
		instance_destroy();	
	}
	if(from == noone || !instance_exists(from))
	{
		instance_destroy();	
	}
	if(to != noone && from != noone && instance_exists(to) && instance_exists(from))
	{
		if(instance_exists(obj_graph) && obj_graph.drag)
		{
			var objdrag = obj_graph.objdrag;
			if(objdrag != noone && instance_exists(objdrag))
			{
				direction = point_direction(from.x,from.y,to.x,to.y);
				if(objdrag == from || objdrag == to)
				{
					xs = from.x;// + lengthdir_x(from.ewidth,direction);
					ys = from.y;// + lengthdir_y(from.eheight,direction);
					xe = to.x - lengthdir_x(to.ewidth,direction);
					ye = to.y - lengthdir_y(to.eheight,direction);
				}
			}
		}
	}
	x = xs + ((xe - xs)/2);
	y = ys + ((ye - ys)/2) + (displace ? 16 : -16);
}