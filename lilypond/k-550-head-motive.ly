\version "2.20.0"

\header {
  % Remove default LilyPond tagline
  tagline = ##f
  %ragged-right = ##t
  %ragged-last = ##t
}

#(set-global-staff-size 11)


#(set! paper-alist (cons '("my size" . (cons (* 0.7 in) (* 0.35 in))) paper-alist))

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
  \setAnalysisBracket
  \blueText
  es8 (d) |
  d4
}

left = \relative c'' {
 \global
 \stopStaff
 s4 |
 s1 * 12
 \startStaff
 r4 fis, (g a bes c8 bes a4 g fis) r
}

\score {
  <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
      \remove Time_signature_engraver
    } \right
  >>

  \layout { }
  \midi {
    \tempo 2=100
  }
}
