//Move the zoom level based on mouse scrolling. Clamp the value so stuff doesn't get too silly.
zoom_level = clamp(zoom_level + (((mouse_wheel_down() - mouse_wheel_up())) * 0.1), 0.1, 5);

//Get current size
var view_w = camera_get_view_width(camera);
var view_h = camera_get_view_height(camera);

//Set the rate of interpolation
var rate = 0.2;

//Get new sizes by interpolating current and target zoomed size
var new_w = lerp(view_w, zoom_level * default_zoom_width, rate);
var new_h = lerp(view_h, zoom_level * default_zoom_height, rate);

//Apply the new size
camera_set_view_size(camera, new_w, new_h);

//Get the shift necessary to re-align the view.
var shift_x = camera_get_view_x(camera) - (new_w - view_w) * 0.5;
var shift_y = camera_get_view_y(camera) - (new_h - view_h) * 0.5;

//Update the view position
camera_set_view_pos(camera,shift_x, shift_y);