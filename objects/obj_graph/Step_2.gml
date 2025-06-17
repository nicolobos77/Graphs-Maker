if(mouse_x >= xmenu && mouse_x <= xmenu + wmenu
&& mouse_y >= ymenu && mouse_y < ymenu + hmenu)
{
	option = floor((mouse_y - ymenu) / hoption);
}