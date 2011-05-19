
Strict

Import mojo.audio

Class SoundManager
	Const CHANNEL_SFX:Int = 0
	
	Const BACKGROUND_MUSIC:String = "sfx/theme.ogg"
	Const ROCKET:Int = 0
	Const EXPLODE:Int = 1
	Const SOUNDS:Int = 2

	Global sfx:Sound[SOUNDS]	
	
	Function LoadSounds:Void()
		sfx[ROCKET] = LoadSound("sfx/rocket.ogg")
		sfx[EXPLODE] = LoadSound("sfx/xplode.ogg")
	End
	
	Function Play:Void(sound:Int)
		StopChannel(sound + CHANNEL_SFX)
		PlaySound(sfx[sound], sound + CHANNEL_SFX)
	End			
End




