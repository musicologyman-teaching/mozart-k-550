\version "2.18.2"

\header {
  % Remove default LilyPond tagline
  tagline = ##f
  ragged-right = ##t
  ragged-last = ##t
}
#(set-global-staff-size 11)


#(set! paper-alist (cons '("my size" . (cons (* 7 in) (* 0.7 in))) paper-alist))

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
}

\layout {
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
  }
}

turnNotesRed = #(define-music-function
                 (parser location notes)
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
                       (parser location)
                       ()
                       #{
                          \override HorizontalBracket.direction = #UP
                          \override HorizontalBracket.color = #blue
                          \override HorizontalBracket.thickness = #3.0
                          \override HorizontalBracket.bracket-flare = #'(0.0 . 0.0)
                          \override HorizontalBracket.padding = #1.0
                       #})

blueText = \override TextScript.color = #blue

right = \relative c''' {
  \global
  \setAnalysisBracket
  \blueText
   bes1 \f
   f2. r8 f \startGroup  ^\markup { \bold  \fontsize #5.0 c }
   es4-. g-. bes-. \stopGroup r |
   d,-. \startGroup  ^\markup { \bold  \fontsize #5.0 c' } f-. bes-. \stopGroup r8 d, \startGroup ^\markup { \bold  \fontsize #5.0 c'' }|
   c4-. es-. g-. \stopGroup c,-. \startGroup  ^\markup { \bold  \fontsize #5.0 c''' } |
   bes-. d-. f-. \stopGroup r8
     \override HorizontalBracket.color = #red
     f \startGroup |
   \repeat unfold 3  { e f g a bes c des \stopGroup f, \startGroup }
   e f g a bes c des \stopGroup e, |
   f2

}


\score {
  <<
    \new Staff = "right" \with {
      midiInstrument = "string ensemble 1"
      \remove Time_signature_engraver
    } \right
  >>

  \layout { }
  \midi {
    \tempo 2=100
  }
}
