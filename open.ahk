^a::

Loop, D:\Users\hanwang\Desktop\test\*.ims, F
{

	Run, %A_LoopFileFullPath%

	loaded := False
	while(loaded = false){
		sleep 1000
		
		looking := true
		while(looking){
			sleep 1000
			ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, image_processing.png
			if(ErrorLevel = 0){
				looking := false
			}else if(ErrorLevel = 1){
			;msgBox, "still looking..."
			}
		}


			loaded := true
	}
		;msgBox, "ready to click!"
		;sleep 1000
		MouseClick, left, X, Y, 1

		sleep 500
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight,filament_functions.png
		if(ErrorLevel = 0){
			MouseClick, left, X, Y, 1
		}else{
			msgBox, "did not find filament_functions"
			return
		}

		sleep 500
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight,filament_dendrogram_analysis.png
		if(ErrorLevel = 0){
			MouseClick, left, X, Y, 1
		}else{
			msgBox, "did not find filament_dendrogram_analysis"
			return
		}





	while (!WinExist("MATLAB Command Window")) {
			sleep 1000
	}


	while (WinExist("MATLAB Command Window")) {
			sleep 1000
	}

	sleep 1000


	WinGet, id, list, , , Program Manager
	Loop, %id%
	{
		StringTrimRight, this_id, id%a_index%, 0
		WinGetTitle, this_title, ahk_id %this_id%
		winclose,%this_title%
	}


	while (!WinExist("Close Imaris - Save changes?")) {
			sleep 10
	}

	ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight,yes.png
	MouseClick, left, X, Y, 1

	sleep 6000


}
return




Esc::ExitApp