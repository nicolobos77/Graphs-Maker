var i_d = ds_map_find_value(async_load, "id");
switch(i_d)
{
	case get_vertex_data:
		if(ds_map_find_value(async_load, "status"))
		{
			if(ds_map_find_value(async_load, "result") != "")
			{
				if(vertexsetdata != noone && instance_exists(vertexsetdata))
				{
					vertexsetdata.data = ds_map_find_value(async_load, "result");
				}
				vertexsetdata = noone;
			}
		}
		message = false;
	break;
	case get_edge_weight:
		if(ds_map_find_value(async_load, "status"))
		{
			if(ds_map_find_value(async_load, "result") != "")
			{
				if(edgesetweight != noone && instance_exists(edgesetweight))
				{
					var result = ds_map_find_value(async_load, "result");
					edgesetweight.weight = result;
					edgesetweight.heavy = true;
					edgesetweight.width = 4 + string_width(result) / 2;
					edgesetweight.height = 4 + string_height(result) / 2;
				}
				edgesetweight = noone;
			}
		}
		message = false;
	break;
	case get_type_graph:
		if(ds_map_find_value(async_load, "status"))
		{
			if(ds_map_find_value(async_load, "result") != "")
			{
				graphtype = ds_map_find_value(async_load, "result");
			}
		}
		message = false;
		if(!setheavy)
		{
			message = true;
			alarm[0] = 1;
		}
		break;
	case get_is_heavy:
		if(ds_map_find_value(async_load, "status"))
		{
			isheavy = true;
		}
		message = false;
	break;
}