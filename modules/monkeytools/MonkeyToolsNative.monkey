' MonkeyToolsSystem.monkey

#If TARGET="android" Then
	Import "native/MonkeyTools.java"
	Function HideMouse:Void()End
	Function ShowMouse:Void()End
	Extern
		Function ExitApp:Void()="MonkeyTools.ExitApp"
#Else If TARGET="html5"
	Import "native/MonkeyTools.js"
	Extern
		Function ExitApp:Void()="MonkeyTools.ExitApp"
        Function HideMouse:Void()="MonkeyTools.HideMouse"
		Function ShowMouse:Void()="MonkeyTools.ShowMouse"
#Else If TARGET="flash"
	Import "native/MonkeyTools.as"
	Extern
		Function ExitApp:Void()="MonkeyTools.ExitApp"
        Function HideMouse:Void()="MonkeyTools.HideMouse"
		Function ShowMouse:Void()="MonkeyTools.ShowMouse"
#Else If TARGET="xna"
	Import "native/MonkeyTools.cs"
	Extern
		Function ExitApp:Void()="MonkeyTools.ExitApp"
        Function HideMouse:Void()="MonkeyTools.HideMouse"
		Function ShowMouse:Void()="MonkeyTools.ShowMouse"
#Else
	Import "native/MonkeyTools.cpp"
	Extern
		Function ExitApp:Void()="MonkeyTools::ExitApp"
        Function HideMouse:Void()="MonkeyTools::HideMouse"
		Function ShowMouse:Void()="MonkeyTools::ShowMouse"
#Endif

Public
