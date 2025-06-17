/// graph_find_edge_index
///@param vertex
///@param vertex
function graph_find_edge_index(argument0, argument1) {
	if(!is_undefined(argument0) && !is_undefined(argument1)
	&& argument0 != noone && argument1 != noone
	&& instance_exists(argument0) && instance_exists(argument1))
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
				result = i;
			}
			else
			{
				i++;
			}
		}
		return i;
	}
	else
	{
		return -1;	
	}


}
