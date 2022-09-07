;ctrl on hold
;escape on tap
*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

*CapsLock up::
    If ((A_TickCount-cDown)<400)  ; Modify press time as needed (milliseconds)
        Send {Blind}{Ctrl Up}{Esc}
    Else
        Send {Blind}{Ctrl Up}
Return

;ctrl on hold
;enter on tap
*Enter::
	Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

*Enter up::
    If((A_TickCount-cDown)<400)
        ;not sure why Ctrl Up is here
	    Send {Blind}{Ctrl Up}{Enter}
    Else
		Send {Blind}{Ctrl up}
Return