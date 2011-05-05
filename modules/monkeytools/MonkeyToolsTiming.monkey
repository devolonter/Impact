' MonkeyToolsTiming.monkey

Import mojo

Class Timer
	Field timer:Float
	Field starttime:Float
	Field stoptime:Float
	Field paused:Bool
	Field stopped:Bool
	Method New()
		stopped=True
	End
	Method Start:Void()
		Reset
		Resume
	End
	Method Pause:Void()
		If Not paused Then
			paused=True
		End
	End
	Method Stop:Void()
		If Not stopped Then
			stopped=True
			stoptime=Millisecs
			If paused Then timer=Millisecs
		End
	End
	Method Resume:Void()
		If paused Then paused=False
		If stopped Then
			stopped=False
			starttime+=Millisecs-stoptime
		End
	End
	Method Reset:Void()
		starttime=timer
	End
	Method GetTime:Float()
		If Not stopped Then
			If Not paused Then timer=Millisecs
		End
		Return (timer-starttime)/1000.0
	End
End
