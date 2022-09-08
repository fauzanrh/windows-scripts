;note: works like shit
;ctrl on hold
;enter on tap
*Enter::
	Keywait, Enter, T.3
	if !Errorlevel {
		Send, {Enter}
		return
	}
	Keywait, Enter, L
	Send, {Ctrl Down}
	Keywait, Enter
	Send, {Ctrl Up}
return


; Smart capslock
g_LastCtrlKeyDownTime := 0
g_AbortSendEsc := false
g_ControlRepeatDetected := false

*CapsLock::
    if (g_ControlRepeatDetected)
    {
        return
    }

    send,{Ctrl down}
    g_LastCtrlKeyDownTime := A_TickCount
    g_AbortSendEsc := false
    g_ControlRepeatDetected := true

return

*CapsLock Up::
    send,{Ctrl up}
    g_ControlRepeatDetected := false
    if (g_AbortSendEsc)
    {
        return
    }
    current_time := A_TickCount
    time_elapsed := current_time - g_LastCtrlKeyDownTime
    if (time_elapsed <= 250)
    {
        SendInput {Esc}
    }
    return
return
