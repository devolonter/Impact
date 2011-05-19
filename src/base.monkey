Strict

Import mojo
Import bullet
Import gameobject
Import application
Import input

Class Base Extends GameObject
	Global img:Image
	
	Function Init:Void()
		If (img = Null) Then img = LoadImage("gfx/base.png", 1, Image.XPadding)
	End
	
	Function Create:Base()
		Return New Base
	End Function
	
	Method OnRender:Void()
		DrawImage(img, x, y)
	End
	
	Method OnUpdate:Void()
		If (MouseHit(MOUSE_LEFT))
			Local x:Int = VirtualMouseX()			
			Local y:Int = VirtualMouseY()
			Bullet.Create(x,y)
		End
	End
	
	Method Destroy:Void()
		list.Remove(Self)
	End
	
	Private
	
	Method New()
		x = 135
		y = 249
	End
End

