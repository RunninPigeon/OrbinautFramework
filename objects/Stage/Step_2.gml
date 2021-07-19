/// @description Stage Scripts
// You can write your code in this editor

	if (GamePaused) exit;
	
	// Update stage
	StageActUpdate();
	
	// Update objects
	//StageObjectsSystem();
	
	// Update boundaries
	StageBoundariesUpdate();
	
	// Check for unloading the stage
	StageActUnload();	