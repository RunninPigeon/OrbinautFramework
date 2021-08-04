function GameAudioStartup()
{
	// Load audiogroups
	audio_group_load(GlobalSFX);
	audio_group_load(BGM);
	
	// Set groups volume to game volume
	audio_group_set_gain(GlobalSFX, Game.SoundVolume, 0);
	audio_group_set_gain(BGM,	    Game.MusicVolume, 0);
}