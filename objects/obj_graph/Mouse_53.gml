// If there's a message open
if(!message)
{
	cursor_sprite = spr_cursor_hand;
	// If the menu is showing and the mouse is on the menu
	if(show_menu && (mouse_x >= xmenu && mouse_x <= xmenu + wmenu
		&& mouse_y >= ymenu && mouse_y < ymenu + hmenu))
	{
		// If there's not a selected object
		if(selected == noone)
		{
			// Check which option is clicked, right click on background
			switch(option)
			{
				case 0:
					// Create a new vertex
					vertexsetdata = instance_create_layer(mouse_x,mouse_y,"Vertices",obj_vertex);
					// Mark the message is open
					message = true;
					// Show a message to get the vertex data
					get_vertex_data = get_string_async("Dato del vertice:",vertexsetdata.data);
				break;
				case 1:
					message = true;
					get_type_graph = get_string_async("Tipo de dato del grafo:","String");
				break;
				case 2:
					isheavy = !isheavy;
					var edgecount = instance_number(obj_edge);
					for(var e = 0; e < edgecount; e++)
					{
						// Find edge instance
						var edge = (instance_find(obj_edge,e));
						// If the edge exists
						if(edge != noone && edge != -1 && instance_exists(edge))
						{
							edge.heavy = isheavy;
						}
					}
				break;
				case 3:
					// Count how many vertex there are
					var vertexcount = instance_number(obj_vertex);
					// Count how many edges there are
					var edgecount = instance_number(obj_edge);
					// Create the graph code
					var code = "Grafo<" + string(graphtype) + "> grafoNuevo = new GrafoImplListAdy<" + string(graphtype) + ">();\n";
					// Create a list to save vertices
					var listid = ds_list_create();
					// Loop through the vertex instances
					for(var i = 0; i < vertexcount; i++)
					{
						// Find vertex instance
						var vertex = (instance_find(obj_vertex,i));
						// If the vertex exists
						if(vertex != noone && vertex != -1 && instance_exists(vertex))
						{
							if(graphtype == "String")
							{
								collons = "\"";	
							}
							else
							{
								collons = "";
							}
							// Create vertex code
							code += "Vertice<" + string(graphtype) + "> vert" + string(i+1) + " = new VerticeImplListAdy<" + string(graphtype) + ">(" + collons + string(vertex.data) + collons + ");\n";
							// Add vertex to the graph
							code += "grafoNuevo.agregarVertice(vert" + string(i+1) + ");\n";
							// Add the current vertex to the list
							ds_list_add(listid,vertex);
						}
					}
					// Loop through the edge instances
					for(var e = 0; e < edgecount; e++)
					{
						// Find edge instance
						var edge = (instance_find(obj_edge,e));
						// If the edge exists
						if(edge != noone && edge != -1 && instance_exists(edge))
						{
							// Find vertex from
							var from = ds_list_find_index(listid,edge.from) + 1;
							// Find vertex to
							var to = ds_list_find_index(listid,edge.to) + 1;
							// If the edge is heavy
							if(isheavy)
							{
								code += "grafoNuevo.conectar(vert" + string(from) + ",vert" + string(to) + "," + string(edge.weight) + ");\n";
								if(!edge.dir)
								{
									// Connect the vertex from to vertex to without direction, with weight
									code += "grafoNuevo.conectar(vert" + string(to) + ",vert" + string(from) + "," + string(edge.weight) + ");\n";
								}
							}
							else
							{
								code += "grafoNuevo.conectar(vert" + string(from) + ",vert" + string(to) + ");\n";

								if(!edge.dir)
								{
									// Connect the vertex from to vertex to without direction
									code += "grafoNuevo.conectar(vert" + string(to) + ",vert" + string(from) + ");\n";
								}
							}
						}	
					}
					// Copy the code to clipboard
					clipboard_set_text(code);
				break;
			}
		}
		else
		{
			// Switch option, right click on vertex
			switch(option)
			{
				case 0:
					// If the selected vertex exists
					if(instance_exists(selected))
					{
						// Destroy it
						instance_destroy(selected);
					}
				break;
				case 1:
					// Add edge without direction
					// Start line
					line = true;
					// Stop direction
					dir = false;
					// Start connect
					connect = true;
					
					cursor_sprite = spr_cursor_point;
				break;
				case 2:
					// Add edge with direction
					// Start line
					line = true;
					// Start direction
					dir = true;
					// Start connect
					connect = true;
					
					cursor_sprite = spr_cursor_point;
				break;
				case 3:
					// Disconnect edge
					// If the vertex is connected
					if(connected)
					{
						// Start line
						line = true;
					}
					// Stop connect
					connect = false;
				break;
			}
		}
	}
	else
	{
		// If the menu is showing
		if(show_menu)
		{
			// Deselect object
			selected = noone;
		}
		// If the line is started and there is a object selected
		if(line && selected != noone && instance_exists(selected))
		{
			link = noone;
			// Find the nearest vertex
			with(obj_vertex)
			{
				var mx = mouse_x;
				var my = mouse_y;
				if((mx >= x - ewidth) && mx <= (x + ewidth)
				&& (my > y - eheight) && my < (y + eheight))
				{
					if(canLink)
					{
						with(obj_vertex)
						{
							canLink = false;	
						}
						obj_graph.link = self;
						
					}
				}
				canLink = true;
			}
			// If the nearest vertex exists
			if(link != noone && instance_exists(link))
			{
				// If the vertex is connected and want to disconnect
				if(connected && !connect)
				{
					// Find the index of the edge from selected vertex and clicked vertex
					var edge = graph_find_edge_index(selected,link);
					// If it's found
					if(edge != -1)
					{
						// Find the edge object instance
						var deledge = ds_list_find_value(selected.adjacents,edge);
						// If it exists
						if(deledge != undefined && deledge != noone && instance_exists(deledge))
						{
							// Destroy it
							instance_destroy(deledge);
						}
						// Remove it from the list
						ds_list_delete(selected.adjacents,edge);
					}
					// Find the index of the edge from clicked vertex and selected vertex
					edge = graph_find_edge_index(link,selected);
					// If it's found
					if(edge != -1)
					{
						// Find the edge object instance
						var deledge = ds_list_find_value(link.adjacents,edge);
						//If it exists
						if(deledge != undefined && deledge != noone && instance_exists(deledge))
						{
							// Destroy it
							instance_destroy(deledge);
						}
						// Remove it from the list
						ds_list_delete(link.adjacents,edge);
					}
				}
				// If want to connect two vertices
				if(connect)
				{
					var add = false;
					// Find the clicked vertex in selected vertex list
					var edge = (graph_find_edge(selected,link));
					if(edge == -1)
					{
						edge = (graph_find_edge(link,selected));
						if(edge == -1)
						{
							add = true;	
						}
						else
						{
							if(edge.dir && dir)
							{
								add = true;	
							}
						}
					}
					if(add)
					{
						// Create a new edge
						var new_edge = instance_create_layer(selected.x,selected.y,"Edges",obj_edge);
						// Set vertex from
						new_edge.from = selected;
						// Set vertex to
						new_edge.to = link;
						// Make it visible
						new_edge.visible = true;
						// If it has direction set it
						new_edge.dir = dir;
						new_edge.direction = point_direction(selected.x,selected.y,link.x,link.y);
						new_edge.xs = selected.x;
						new_edge.ys = selected.y;
						new_edge.xe = link.x - lengthdir_x(link.ewidth,new_edge.direction);
						new_edge.ye = link.y - lengthdir_y(link.eheight,new_edge.direction);
						// Add it to vertex adjacents list
						ds_list_add(selected.adjacents,new_edge);
						// If it has direction
						if(dir)
						{
							// Find selected vertex on clicked vertex list
							found = graph_find_edge(link,selected) != -1;
							// If it's connected
							if(found)
							{
								// Set displace
								new_edge.displace = true;
							}
						}
						else
						{
							// Find selected vertex on clicked vertex list
							found = graph_find_edge(link,selected) != -1;
							// If it's found
							if(!found)
							{
								// Add edge to adjacent list
								ds_list_add(link.adjacents,new_edge);
							}
						}
						if(isheavy)
						{
							// Set a var to set the edge weight on async event
							edgesetweight = new_edge;
							// Show the message to get the weight
							get_edge_weight = get_integer_async("Peso de la arista:","0");
							// Mark the message is open
							message = true;
						}
						else
						{
							new_edge.weight = 0;	
						}
					}
				}
			}
		}
		// Reset vars
		connected = false;
		line = false;
		link = noone;
		selected = noone;
		dir = false;
	}
	// Hide menu
	show_menu = false;
}