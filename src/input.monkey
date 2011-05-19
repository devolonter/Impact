Import mojo.input
Import application

Function VirtualMouseX:Float() 
	Return MouseX()	/ Application.GetInstance().zoomFactorX		
End Function


Function VirtualMouseY:Float()
	Return MouseY()	/ Application.GetInstance().zoomFactorY	
End Function

