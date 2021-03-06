
Strict

Import mojo
Import gameobject
Import collision
Import bullet
Import application
Import scenegame
Import input

Class PowerUp Extends GameObject
	Global img:Image

	Field destroyed:Bool

	Const MAX_GRAVITATION:Int = 4	
	Const FRAMES:Int = 32
	Const ANIMATION_SPEED:Float = 0.5
	
	Field frame:Float
	Field dx:Float, dy:Float

	Function Init:Void()
		If (img = Null)
			img = LoadImage("gfx/powerup1.png", 16, 16, FRAMES, Image.MidHandle)
		End
	End
	
	Function Discard:Void()
		if (img <> null) Then
			img.Discard()
			img = null
		End
	End Function
	
	Function Create:PowerUp(x:Float, y:Float, dx:Float, dy:Float)
		Local p:PowerUp
		For Local go:GameObject = Eachin list
			If PowerUp(go)
				p = PowerUp(go)
				If (p.IsDestroyed()) Then Exit
				p = Null
			End
		Next
		If (Not p) Then p = New PowerUp
		p.x = x
		p.y = y
		p.dx = dx
		p.dy = dy
		p.destroyed = False
		Return p
	End
	
	Method OnRender:Void()
		DrawImage(img, x, y, frame)
	End
	
	Method OnUpdate:Void()		
		If IsDestroyed() Then Return
		If (MouseDown(MOUSE_LEFT))
			Local mx:Int = VirtualMouseX()	
			Local my:Int = VirtualMouseY()	
			If (Collision.IntersectCircle(mx, my, 16, x, y, 16))
				Bullet.PowerUp()
				Local s:SceneGame = SceneGame(Application.GetInstance().currentScene)
				s.score += 125
				Destroy()
				Return
			End If
		End If

		frame += ANIMATION_SPEED
		If (frame >= FRAMES) Then frame = 0
		
		x += dx
		y += dy
		
		If dy < MAX_GRAVITATION Then dy += 0.05
		
		If (y > Application.WIDTH + 32) Then Destroy()
	End
	
	Method Destroy:Void()
		destroyed = True
	End
	
	Method IsDestroyed:Bool()
		Return destroyed
	End	
End


