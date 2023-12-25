; Variables - "Global Constants":
UserInitials := "ICM"


; Functions


;-------------------------------------------------------------------------------
; Hotkeys
;-------------------------------------------------------------------------------
; none used - too dangerous to me - ICM 2010-05-19
#space::Run www.google.co.uk


;-------------------------------------------------------------------------------
; Utilities
;-------------------------------------------------------------------------------
DateNowReversed() {
  FormatTime, CurrentDate,,yyyy-MM-dd
  return CurrentDate
}

Sign() {
  date_tag := DateNowReversed()
  global UserInitials
  return UserInitials . " " . date_tag
}

SignedTag(tag) {
  s := tag . " " . sign() . ": "
  return s
}


;-------------------------------------------------------------------------------
; Hotstrings
;-------------------------------------------------------------------------------

; This is how to change what are considered as end chars:
; These are the defaults, and they include the space character:
;#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t
#Hotstring EndChars `t


; simplest example:
;::btw::by the way
;
; simplest example, tweaked to not produce a trailing tab
; (the completion character), but a trailing space instead:
:o:btw::by the way `


; Typing:
:o:ie::i.e. `
:o:eg::e.g. `


;-------------------------------------------------------------------------------
; General
;-------------------------------------------------------------------------------

::sig::
s := "-- " . Sign()
SendInput %s%
return


::todo::
tag := SignedTag("TODO:")
SendInput %tag%
return


::hack::
tag := SignedTag("HACK:")
SendInput %tag%
return


::rev::
tag := SignedTag("REVIEW:")
SendInput (
SendInput %tag%
SendInput  )
SendInput {left 1}
return


:O:rule::
(
12345678901234567890123456789012345678901234567890123456789012345678901234567890
50------------------------------------------------
72----------------------------------------------------------------------
80------------------------------------------------------------------------------

)


;-------------------------------------------------------------------------------
; Coding
;-------------------------------------------------------------------------------

::by::
EnvGet, user, USERNAME
s := "//{!} @author`t" . user . "`r//{!} @date`t" . DateNowReversed()
SendInput %s%
return


;-------------------------------------------------------------------------------
; Confluence wiki / textile
;-------------------------------------------------------------------------------
::{code::
SendInput {RAW}{code:none}{code}
SendInput {left 6}
return

::{panel::
SendInput {RAW}{panel}{panel}
SendInput {left 7}
return


;-------------------------------------------------------------------------------
; XHTML
; :o: to omit the end character:
; :c: case sensitive - would this be a good idea for XHTML?
;-------------------------------------------------------------------------------

XmlTag(tag_core) {
  tag_start := "<"  . tag_core . ">"
  tag_end   := "</" . tag_core . ">"

  s := tag_start . tag_end

  num_chars := StrLen(tag_end)
  SendInput %s%{left %num_chars%}
}


; TODO: use A_ThisHotkey and strip some of its modifiers
; (inside the first :: pair) to extract e.g. <p>
; and then extract the core tag
XmlTagComplete(tag_core) {
  tag_end   := "</" . tag_core . ">"

  s := tag_end

  num_chars := StrLen(tag_end)
  SendInput %s%{left %num_chars%}
}


; b0 turns off back-spacing of the typed phrase
:b0o:<zz>::
XmlTagComplete("zz")
return

:o:xx::
;XmlTag(A_ThisLabel)
XmlTag(A_ThisHotkey)
return


; Standard XHTML tags (single letter tags come later)

:o:body::
XmlTag("body")
return

:o:code::
XmlTag("code")
return

:o:em::
XmlTag("em")
return

:o:h1::
XmlTag("h1")
return

:o:h2::
XmlTag("h2")
return

:o:h3::
XmlTag("h3")
return

:o:h4::
XmlTag("h4")
return

:o:h5::
XmlTag("h5")
return

:o:h6::
XmlTag("h6")
return

:o:head::
XmlTag("head")
return

:o:html::
XmlTag("html")
return

:o:title::
XmlTag("title")
return



; Short tags - require a < to start, to avoid ruining tab completion and
; accidental invocation

; see also hre to paste a URL
:o:<a::
SendInput <a href=""></a>{left 4}
return

:o:<b::
XmlTag("b")
return

:o:<p::
XmlTag("p")
return


; hre is short for href, and assumes a link in the clipboard
:o:hre::
SendInput <a href="%Clipboard%"></a>{left 4}
return
