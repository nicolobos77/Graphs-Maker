draw_set_halign(fa_left);
draw_set_valign(fa_top);
if(show_menu)
{
	draw_rectangle_color(xmenu,ymenu,xmenu + wmenu,ymenu + hmenu,c_gray,c_gray,c_gray,c_gray,0);
	if(option != -1)
	{
		draw_rectangle_color(xmenu,ymenu + (hoption * option),xmenu + wmenu, ymenu + (hoption * option) + hoption,c_blue,c_blue,c_blue,c_blue,0);
	}
	draw_set_color(c_black);
	if(selected == noone)
	{
		draw_text(xmenu + 3, ymenu - 3, "Agregar vertice");
		draw_text(xmenu + 3, ymenu + hoption - 3, "Cambiar tipo de grafo");
		if(isheavy)
		{
			draw_text(xmenu + 3, ymenu + (hoption * 2) - 3, "Cambiar grafo a no pesado");
		}
		else
		{
			draw_text(xmenu + 3, ymenu + (hoption * 2) - 3, "Cambiar grafo a pesado");
		}
		draw_text(xmenu + 3, ymenu + (hoption * 3) - 3, "Generar código");
	}
	else
	{
		draw_text(xmenu + 3, ymenu, "Eliminar vertice");
		draw_text(xmenu + 3, ymenu + hoption - 3, "Conectar vertice no dirigido");
		draw_text(xmenu + 3, ymenu + (hoption * 2) - 3, "Conectar vertice dirigido");
		if(connected)
		{
			draw_text(xmenu + 3, ymenu + (hoption * 3) - 3, "Desconectar vertice");
		}
	}
}
if(line && selected != noone)
{
	var edirection = point_direction(selected.x,selected.y,mouse_x,mouse_y);
	if(connected && !connect)
	{
		draw_line_color(selected.x + lengthdir_x(selected.ewidth,edirection),selected.y + lengthdir_y(selected.eheight,edirection), mouse_x,mouse_y,c_red,c_red);
	}
	else
	if(!dir)
	{
		draw_line_color(selected.x + lengthdir_x(selected.ewidth,edirection),selected.y + lengthdir_y(selected.eheight,edirection), mouse_x,mouse_y,c_white,c_white);
	}
	else
	{
		draw_set_color(c_aqua);
		draw_arrow(selected.x + lengthdir_x(selected.ewidth,edirection),selected.y + lengthdir_y(selected.eheight,edirection),mouse_x,mouse_y,16);
	}
}