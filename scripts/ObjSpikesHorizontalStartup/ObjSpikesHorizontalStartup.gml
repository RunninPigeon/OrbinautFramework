function ObjSpikesHorizontalStartup()
{
	// Create variables
	HurtSide isReal;
	
	// Set object solidbox
	object_set_solidbox(16, 16);
	
	// Set object depth
	object_set_depth(Player, false);
	
	// Define hurt side
	HurtSide = image_xscale == 1 ? SideRight : SideLeft;
}