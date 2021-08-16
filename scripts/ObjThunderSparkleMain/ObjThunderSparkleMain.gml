function ObjThunderSparkleMain()
{
	if DoMovement
	{
		// Perform movement
		if (++Timer) < 22
		{
			switch SparkleID
			{
				case 0:
				{
					x -= 2;
					y -= 2;
				}
				break;
				case 1:
				{
					x -= 2;
					y += 2;
				}
				break;
				case 2:
				{
					x += 2;
					y -= 2;
				}
				break;
				case 3:
				{
					x += 2;
					y += 2;
				}
				break;
			}
		}
		
		// Destroy objecta after 21 frames
		else
		{
			instance_destroy();
		}
	}
	
	// Start movement on the second frame
	else
	{
		DoMovement = true;
	}
}