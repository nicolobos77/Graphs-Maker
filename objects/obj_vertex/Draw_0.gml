draw_ellipse_color(x - ewidth,y - eheight,x + ewidth,y + eheight,c_black,c_black,0);
draw_ellipse_color(x - ewidth,y - eheight,x + ewidth,y + eheight,c_white,c_white,1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_color(x,y,data,c_white,c_white,c_white,c_white,1);