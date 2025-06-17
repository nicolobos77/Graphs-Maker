/// graph_find_edge
///@param vertex
///@param vertex
function graph_find_edge(argument0, argument1) {
	if(instance_exists(argument0) && instance_exists(argument1))
	{
		var i = 0;
		var found = false;
		var result = -1;
		while(i < ds_list_size(argument0.adjacents) && !found)
		{
			var edge = ds_list_find_value(argument0.adjacents,i);
			if(!is_undefined(edge) && edge != noone && instance_exists(edge) && edge.to == argument1)
			{
				found = true;
				result = edge;
			}
			i++;
		}
		return result;
	}
	else
	{
		return -1;	
	}


}
