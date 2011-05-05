// MonkeyTools.as

import flash.ui.Mouse;

class MonkeyTools
{
	static public function ExitApp():void
	{
		app.graphics.Cls(255,255,255);
		app.dead=1;		
		getConsole().textColor=0x00000000;
		print("Game Terminated. Refresh page to restart Game.");
	}
	static public function ShowMouse():void
	{
		Mouse.show();
	}
	static public function HideMouse():void
	{
		Mouse.hide();
	}
}
