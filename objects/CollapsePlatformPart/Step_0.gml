/// @description Insert description here
// You can write your code in this editor
	
	if Timer  
	{
		Timer--;
	}
	else
	{
		SpdY += 0.21875;
		PosY += SpdY;
		y = floor(PosY);
		if y >= Screen.CameraY + Screen.Height + 32
		{
			instance_destroy();
		}
	}