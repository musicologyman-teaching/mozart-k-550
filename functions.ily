\version "2.18.2"

colorVoice =
#(define-music-function
  (parser location c notes )
  (color? ly:music?)
  #{
    \override NoteHead.color = #c
    \override Stem.color = #c
    \override Beam.color = #c
    \override Slur.color = #c
    \override Accidental.color = #c
    \override DynamicText.color = #c
    \override Rest.color = #c
    \override Script.color = #c
    \override Tie.color = #c
    #notes
    \revert NoteHead.color
    \revert Stem.color
    \revert Beam.color
    \revert Slur.color
    \revert Accidental.color
    \revert DynamicText.color
    \revert Rest.color
    \revert Script.color
    \revert Tie.color
  #})

endRepeat =
#(define-music-function
  (parser location)
  ()
  #{
    \set Score.repeatCommands = #'(end-repeat)
  #})

shiftTextScriptHorizontal =
#(define-music-function
  (parser location offset notes)
  (number? ly:music?)
  #{
    \override TextScript.X-offset = #offset
    #notes
    \revert TextScript.X-offset
  #})

blackRest =
#(define-music-function
  (parser location)
  ()
  #{
    \override Rest.color = #black
  #})