Strict

Import mojo
Import gameobject

Class Explosion Extends GameObject
	Global img:Image[2]	
	Global collisionRadius:Float
	
	Field ANIM_SPEED:Float[] = [.75, .5]
	Const FRAMES:Int = 32
	
	Field frame:Float
	Field typ:Int
	
	Function Init:Void()
		If (img[0] = Null Or img[1] = Null)
			img[0] = LoadImage("gfx/explosion3.png", 128, 128, FRAMES, Image.MidHandle)
			img[1] = LoadImage("gfx/mushroom.png", 128, 128, FRAMES, Image.MidHandle)
			collisionRadius = img[0].Width() * 0.25			
		End			
	End
	
	Function Discard:Void()
		if (img[0] <> null) img[0].Discard()
		if (img[1] <> null) img[1].Discard()
		img[0] = null
		img[1] = null
	End Function
	
	Function Create:Explosion(x:Int, y:Int, typ:Int = 0)
		Local e:Explosion

		For Local go := Eachin list			
			Local el:Explosion = Explosion(go)
			If (el And el.IsDestroyed())
				el.x = x
				el.y = y
				el.frame = 0
				el.typ = typ
				Return el
			End
		Next
		
		e = New Explosion
		e.x = x
		e.y = y
		e.typ = typ
		e.frame = 0
		Return e
	End
	
	Method OnUpdate:Void()
		If (IsDestroyed()) Then Return
		frame += ANIM_SPEED[typ]
	End
	
	Method IsDestroyed:Bool()
		Return (frame >= FRAMES)
	End Method
	
	Method OnRender:Void()
		If (IsDestroyed()) Then Return
		DrawImage(img[typ], x, y, frame)
	End
	
	Method Destroy:Void()
		frame = FRAMES
	End
End

