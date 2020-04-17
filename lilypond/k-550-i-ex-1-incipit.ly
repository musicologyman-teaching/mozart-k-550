\version "2.20.0"

\header {
  % Remove default LilyPond tagline
  tagline = ##f
  %ragged-right = ##t
  %ragged-last = ##t
}

#(set-global-staff-size 11)


#(set! paper-alist (cons '("my size" . (cons (* 7 in) (* 1.3 in))) paper-alist))

\paper {
  #(set-paper-size "my size" )
}

\layout {
  indent = 0 \in
  \context {
    \Score \remove "Bar_number_engraver"
  }
}

\layout {
  \context {
    \Staff \RemoveEmptyStaves
  }
}

global = {
  \key g \minor
  \time 2/2
  \partial 4
}

\layout {
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
  }
}

turnNotesRed = #(define-music-function
                 (notes)
                 (ly:music?)
                 #{
                   \override NoteHead.color = #red
                   \override Stem.color = #red
                   \override Beam.color = #red
                   \override Slur.color = #red
                   \override Accidental.color = #red
                   #notes
                   \revert NoteHead.color
                   \revert Stem.color
                   \revert Beam.color
                   \revert Slur.color
                   \revert Accidental.color
                 #})

setAnalysisBracket = #(define-music-function
                       ()
                       ()
                       #{
                          \override HorizontalBracket.direction = #UP
                          \override HorizontalBracket.color = #blue
                          \override HorizontalBracket.thickness = #3.0
                          \override HorizontalBracket.bracket-flare = #'(0.0 . 0.0)
                          \override HorizontalBracket.padding = #1.0
                       #})

blueText = \override TextScript.color = #blue


right = \relative c'' {
  \global
  es8 (d) |
  d4 es8 (d) d4 es8 (d) |
  d4 (bes') r bes8 (a) |
  g4 g8 (f) es4 es8 (d) |
  c4 c  
}


\score {
  <<
    \new Staff = "right" \with {
      midiInstrument = "string ensemble 2"
      \remove Time_signature_engraver
    } \right
  >>

  \layout { }
  \midi {
    \tempo 2=100
  }
}
