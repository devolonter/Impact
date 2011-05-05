// MonkeyTools.cs

class MonkeyTools
{
	public static void ExitApp()
	{
        gxtkApp.game.Exit();   // exit app
    }
	public static void ShowMouse()
	{
		gxtkApp.game.IsMouseVisible=true;
	}
	public static void HideMouse()
	{
		gxtkApp.game.IsMouseVisible=false;
	}
}
