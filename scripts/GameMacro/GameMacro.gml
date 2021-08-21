function GameMacro()
{	
	/* Macros are basically replacement for using digits in your code to
	make it more readable. We could use emums in that case, but macros are easier */
	
	// Global framework macro
	#macro Shader	   global
	#macro Game		   global
	#macro GameCamera  view_camera[0]

	// Object macro
	#macro RangeClose   0
	#macro RangeFar     1
	#macro EnemyBadnik  0
	#macro EnemyBoss    1
	#macro TypeUnload	0
	#macro TypeReset	1
	#macro TypeDelete   2
	
	// Font macro
	#macro Debug	    0
	#macro Counter      1
	#macro CounterSmall 2
	#macro Card			3
	#macro Menu			4

	// Audio macro
	#macro PriorityLow  0
	#macro PriorityHigh 1
	#macro EventIdle	0
	#macro EventMute	1
	#macro EventUnmute  2
	#macro EventStop	3
	
	// Palette macro
	#macro PaletteLimit  64
	#macro PaletteDry    0
	#macro PaletteWet    1
	#macro FadeNone      0
	#macro FadeActive    1
	#macro FadeMax       2
	#macro FadeTo        0
	#macro FadeFrom       1
	#macro FadeBlack     0
	#macro FadeWhite     1
	#macro FadeFlash     2
	#macro FlashWhite	 0
	#macro FlashNegative 1

	// Player macro
	#macro CharSonic		   0
	#macro CharTails	       1
	#macro CharKnuckles	       2
	#macro FlightActive		   1
	#macro FlightStop		   2
	#macro GlideActive	       1
	#macro GlideDrop           2
	#macro GlideStop           3
	#macro FlipLeft			  -1
	#macro FlipRight		   1
	#macro LayerA		       0
	#macro LayerB		       1
	#macro BarrierNormal	   1
	#macro BarrierThunder	   2
	#macro BarrierWater        3
	#macro BarrierFlame		   4	
	#macro AnimIdle		       0
	#macro AnimWalk		       1
	#macro AnimRun		       2
	#macro AnimPeelout	       3
	#macro AnimRoll			   4
	#macro AnimPush			   5
	#macro AnimSpindash		   6
	#macro AnimCrouch		   7
	#macro AnimLookup		   8
	#macro AnimFly			   9
	#macro AnimFlyTired		   10
	#macro AnimHurt			   11
	#macro AnimDeath		   12
	#macro AnimGlide		   13
	#macro AnimClimb		   14
	#macro AnimGlideDrop	   15
	#macro AnimGlideGrounded   16
	#macro AnimSkid			   17
	#macro AnimGlideStand	   18
	#macro AnimClimbering	   19
	#macro AnimBalance		   20
	#macro AnimBalanceFlip	   21
	#macro AnimSpring		   22
	#macro AnimActEnd		   23
	#macro AnimDropStand	   24
	#macro AnimSwim			   25
	#macro AnimSwimTired	   26
	#macro AnimTransform	   27
	#macro AnimDrown		   28
	#macro AnimAirSpin		   29
	#macro AnimBreathe		   30
	#macro AnimDropdash		   31
	#macro AnimMove			   32

	// Stage macro	
	#macro StageLoad           0
	#macro StageActive		   1
	#macro StagePaused		   2
	#macro StageUnload		   3
	
	// Collision macro
	#macro SideTop			   0
	#macro SideLeft			   1
	#macro SideRight		   2
	#macro SideBottom		   3
	#macro SideCentre		   4
	#macro SideCenter		   4
	#macro Hitbox			   0
	#macro Triggerbox		   1
	#macro QuadFloor		   0
	#macro QuadRWall		   1
	#macro QuadRoof			   2
	#macro QuadLWall		   3
	#macro TileSize            16
	#macro TileAmount          146
}