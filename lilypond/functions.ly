\version "2.24.2"

setAnalysisBracket = #(define-music-function
   (parser location)
   ()
   #{
      \override HorizontalBracket.direction = #UP
      \override HorizontalBracket.color = #black
      \override HorizontalBracket.thickness = #3.0
      \override HorizontalBracket.bracket-flare = #'(0.0 . 0.0)
      \override HorizontalBracket.padding = #1.0
   #})
