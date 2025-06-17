if(!message)
{
	with(obj_vertex)
	{
		var mx = event_data[? "posX"];
		var my = event_data[? "posY"];
		if((mx >= x - ewidth) && mx <= (x + ewidth)
			&& (my > y - eheight) && my < (y + eheight))
		{
			if(canDoubleclick)
			{
				with(obj_vertex)
				{
					canDoubleclick = false;	
				}
				obj_graph.vertexsetdata = self;
			}
			canDoubleclick = true;
		}
	}
	if(vertexsetdata != noone && instance_exists(vertexsetdata))
	{
		get_vertex_data = get_string_async("Dato del vertice:",vertexsetdata.data);
	}
	if(isheavy)
	{
		edgesetweight = instance_nearest(event_data[? "posX"],event_data[? "posY"],obj_edge);
		if(edgesetweight != noone)
		{
			var mx = event_data[? "posX"];
			var my = event_data[? "posY"];
			var ex = edgesetweight.x;
			var ey = edgesetweight.y;
			var ew = edgesetweight.width;
			var eh = edgesetweight.height;
			if(mx >= (ex - ew) && mx <= (ex + ew) &&
			my >= (ey - eh) && my <= (ey + eh))
			{
				get_edge_weight = get_string_async("Peso de la arista:",edgesetweight.weight);
			}
			else
			{
				edgesetweight = noone;	
			}
		}
	}
}