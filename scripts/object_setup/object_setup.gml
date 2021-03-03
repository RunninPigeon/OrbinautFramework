/// @function object_setup(type)
function object_setup(type)
{	
	// Report script error
	if type != SolidAll and type != SolidTop and type != SolidNone
	{	
		show_message("Wrong type attribute set for object ID " + string(id) + " in function object_setup. Expected SolidAll (0), SolidTop (1) or SolidNone (2)");
		game_end();
	}
	
	// Set variables for the object
	Solidity        = type;
	GotPlayerHitbox = false;
}