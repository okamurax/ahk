ProcessSetPriority "High"
SetMouseDelay -1
SendMode "Input"
A_MaxHotkeysPerInterval := 200
InstallKeybdHook
#UseHook
CoordMode "Mouse", "Window"

;--------------------------------------------------------

; "C:\Program Files (x86)\Google\Google Japanese Input\GoogleIMEJaTool.exe" -mode=config_dialog

; Hiragana＞IMEを有効化
; Muhenkan＞IMEを無効化

; エントリーを削除
; Henkan
; Shift Henkan
; Shift Muhenkan

;--------------------------------------------------------

>+4::Send "{Enter}"
>+7::Send "{Home}"
>+8::Send "{End}"

>+q::Send "{&}"
>+w::Send "{'}"
>+e::Send "{``}"

>+a::Send "{^}"
>+s::Send "{$}"
>+d::Send "{~}"

>+u::Send "{|}"
>+i::Send "{\}"
>+o::Send "{@}"
>+p::Send "{`%}"

>+n::Send "{(}"
>+m::Send "{)}"

>+h::Send "{Left}"
>+j::Send "{Down}"
>+k::Send "{Up}"
>+l::Send "{Right}"

>+Backspace::Send "{Delete}"

;--------------------------------------------------------

~sc07B::
{
  If (A_PriorHotkey = A_ThisHotkey && 500 > A_TimeSincePriorHotkey)
  {
    Send "{sc070}"
  }
}

sc07B & 1::Send "{F12}"
sc07B & 2::Send "{F2}"

sc07B & q::Send "{Esc}"
sc07B & w::Send "{LWin}"
sc07B & e::Run "explorer.exe"
sc07B & r::Send "#r"

;--------------------------------------------------------

~^c::
{
  If (A_PriorHotkey = A_ThisHotkey && 500 > A_TimeSincePriorHotkey)
  {
    Send "{End}+{Home}^c"
  }
}

;--------------------------------------------------------
				
;sc079 & RShift::Send "#{Tab}"
;sc079 & 1::Send "#^{Left}"
;sc079 & 2::Send "#^{Right}"
sc079 & 3::Send "^{Home}"
sc079 & 4::Send "^{End}"

sc079 & q::Send "!{Left}" ; 戻る
sc079 & w::Send "!{Right}" ; 進む
sc079 & e::Send "^w" ; 閉じる
sc079 & r::Send "!+r" ; Alt+Shift+R / RightTabsToWindow

sc079 & LCtrl::AltTab
sc079 & a::Send "^+{Tab}" ; 前のタブ
sc079 & s::Send "^{Tab}" ; 次のタブ
sc079 & d::Send "^+t" ; 再び開く
sc079 & f::Send "^{F5}" ; 更新

sc079 & z::Send "!+z" ; Alt+Shift+Z / CloseRightTabs

sc079 & ^::Send "!{^}" ; Greenshot
sc079 & \::Send "!{\}" ; Greenshot

sc079 & c::
{
  x := -SysGet(16)
  y := 5
  w := SysGet(16)
  h := SysGet(17)+15
  this_id := WinGetID("A")

  If (WinGetMinMax(this_id) = 1)
  {
    WinRestore(this_id)
  }

  WinMove(x,y,w,h,this_id)

  If (A_PriorHotkey = A_ThisHotkey && 500 > A_TimeSincePriorHotkey)
  {
    WinMove(0,y,w,h,this_id)
  }
}

sc079 & v::
{
  static keyDownCount

  If (A_PriorHotkey = A_ThisHotkey && 500 > A_TimeSincePriorHotkey)
  {
    keyDownCount += 1
    If (keyDownCount > 1)
    {
      keyDownCount := 0
    }
  }
  Else
  {
    keyDownCount := 0
  }

  this_id := WinGetID("A")

  If (keyDownCount = 0)
  {

    If (WinGetMinMax(this_id) = 1)
    {
      WinRestore(this_id)
      WinMove(,,1100,750,this_id)
    }

    WinGetPos(&x,&y,,,this_id)

    if (x = -SysGet(16) or x = 0)
    {
      WinMove(,,1100,750,this_id)
    }

    WinGetPos(,,&w,&h,this_id)
    MouseMove(w//2, 9)
  }
  Else If (keyDownCount = 1)
  {
    WinGetPos(,,&w,&h,this_id)
    MouseMove(w-5, h-5)
  }
}

sc079 & Left::Send "#^{Left}"
sc079 & Right::Send "#^{Right}"

;--------------------------------------------------------

;sc079 & WheelUp::Send "{PgUp}"
;sc079 & WheelDown::Send "{PgDn}"

sc079 & WheelUp::Send "^+{PgUp}" ; 前のタブ
sc079 & WheelDown::Send "^+{PgDn}" ; 次のタブ

+WheelUp::WheelLeft
+WheelDown::WheelRight


;--------------------------------------------------------

#HotIf WinActive("ahk_exe excel.exe") 

sc079 & a::Send "^{PgUp}" ; 前のタブ
sc079 & s::Send "^{PgDn}" ; 次のタブ

sc079 & f::Send "^+{L}"

+sc079::Send "^e" ; オリジナルマクロ用

+Space::
{
  Send "{sc07B}"
  Send "+{Space}"
}

MButton::Send "{F4}"

;--------------------------------------------------------

#HotIf WinActive("ahk_exe mpc-be64.exe")

sc079 & a::Send "^{PgUp}" ; 前のタブ
sc079 & s::Send "^{PgDn}" ; 次のタブ

#HotIf

