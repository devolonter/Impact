
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
			SoundManager.PlayMusic()
			
			'Preload heavyweight resources to avoid freezes before explosion
			Explosion.Create(0,0)	
			Explosion.Create(0,0,1)	
		End
		
		#If TARGET="android"			
			If(timer - Millisecs() < 2000) GameObject.UpdateAll()
		#EndIf
		
		If (timer < Millisecs()) Then Application.GetInstance().SetNextScene("title")
	End
	
	Method OnRender:Void()	
		#If TARGET="android"
			'run preload after first second
			If(timer - Millisecs() < 2000) GameObject.RenderAll()
		#EndIf
		
		DrawImage(logo, 0, 0)	
	End
	
	Method OnEnter:Void()
		logo = LoadImage("gfx/logo.png")
		
		#If TARGET="android"			
			GameObject.list = New List<GameObject>
			Explosion.Init()						
		#EndIf
	End
	
	Method OnLeave:Void()
		logo = Null
		
		#If TARGET="android"
			GameObject.list.Clear()
		#EndIf
	End
End



