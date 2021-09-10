Escape::
ExitApp
Return
F2::
SetTimer, F1 Up, Off
InputBox, BPM , Enter BPM:,,,700, 100
testSend := "a"
MS := 60000 / BPM
F1::SetTimer, F1 Up,% (F1:=!F1)?Floor(MS):"Off"
F1 Up:: sendInput {]} 

~*e::
~*t::
~*/::
~*Esc::
~*Enter::
SetTimer, F1 Up, Off
F1 := False
Return