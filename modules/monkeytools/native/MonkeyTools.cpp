// MonkeyTools.cpp

class MonkeyTools
{
public:
	static void ExitApp()
	{
		exit(0);	// exit app
	}
	static void ShowMouse()
	{
		ShowCursor(true);
	}
	static void HideMouse()
	{
		ShowCursor(false);
	}
};
