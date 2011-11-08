
Strict

Import mojo
Import monkey
Import scene

Import application
Import soundmanager
Import explosion

Class SceneLogo Extends Scene
	Field logo:Image
	Field timer:Int = 0	
	
	Method OnUpdate:Void()
		If (timer = 0)
			timer = Millisecs() + 3000
			PlayMusic(SoundManager.BACKGROUND_MUSIC)
			
			'Preload heavyweight resources to avoid freezes before explosion
			Explosion.Create(0,0)	
			Explosion.Create(0,0,1)	
		End
					
		If(timer - Millisecs() < 2000) GameObject.UpdateAll()
		
		If (timer < Millisecs()) Then Application.GetInstance().SetNextScene("title")
	End
	
	Method OnRender:Void()	
		'run preload after first second
		If(timer - Millisecs() < 2000) GameObject.RenderAll()
		
		DrawImage(logo, 0, 0)	
	End
	
	Method OnEnter:Void()
		logo = LoadImage("gfx/logo.png")
					
		GameObject.list = New List<GameObject>
		Explosion.Init()						
	End
	
	Method OnLeave:Void()
		if (logo <> null) logo.Discard()
		logo = Null		
		GameObject.list.Clear()
	End
	
	Method OnResume:Void()	
	End Method
		
	Method OnSuspend:Void()	
	End Method
	 
End






