/// @function draw_animated_sprite(sprite,speed,timer,x,y)
function draw_animated_sprite(sprite,speed,timer,x,y)
{
	// Animate sprite
	draw_sprite(sprite, timer div speed mod sprite_get_number(sprite), x, y);
}