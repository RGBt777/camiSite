# Tracer Effect

The functions:

trail_x[0] += (screen_x - trail_x[0]).4;
trail_y[0] += (screen_y - trail_y[0]).5;
trail_x[1] += (trail_x[0] - trail_x[1]).3;
trail_y[1] += (trail_y[0] - trail_y[1]).5;

create a tracer effect by modifying the position of the overlay according to the X and Y position of the screen. It lags more horizontally than vertically, giving it a nice LED screen effect.