\version "2.20.0"

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

withBrackets = \relative c''' {
  \global
  \setAnalysisBracket
  \override HorizontalBracket.Y-offset = #6
  \blueText
   bes1 \f \startGroup ^\markup { \bold \fontsize #5.0 a }
   f2. \stopGroup r8 f \startGroup  ^\markup { \bold  \fontsize #5.0 b }
   es4-. g-. bes-. \stopGroup
      r |
   d,-. \startGroup ^\markup { \bold  \fontsize #5.0 b' } f-. bes-. \stopGroup r8 d, \startGroup ^\markup { \bold  \fontsize #5.0 b'' }|
   c4-. es-. g-. \stopGroup
     c,-. \startGroup  ^\markup { \bold  \fontsize #5.0 b''' } |
   bes-. d-. f-. \stopGroup r8
     \override HorizontalBracket.color = #red
     f \startGroup |
   \repeat unfold 3  { e f g a bes c des \stopGroup f, \startGroup }
   e f g a bes c des \stopGroup e, |
   f2

}

withoutBrackets = \relative c''' {
  \global
   bes1 \f
   f2. r8 f |
   es4-. g-. bes-. r |
   d,-. f-. bes-. r8 d, |
   c4-. es-. g-. c,-. |
   bes-. d-. f-. r8 f |
   \repeat unfold 3  { e f g a bes c des f, }
   e f g a bes c des e, |
   f2
}

withoutBracketsAbbr = \relative c''' {
  \global
   bes1 \f
   f2. r8 f |
   es4-. g-. bes-. r |
   d,-. f-. bes-. r8 d, |
   c4-. es-. g-. c,-. |
   bes-. d-. f-. r8 f |
   e f g a bes c des \stopStaff
     \once \override Stem #'transparent = ##t
     \once \override NoteHead #'transparent = ##t
     \once \override TextScript #'Y-offset = #0.0
     \once \override TextScript #'X-offset = #2.0
     \once \override TextScript #'font-size = #5.0
     f, ^\markup \italic "etc."
     \bar ""
}

cadentialPassage = \relative c'' {
  \global
  \partial 4
  es8 (d) |
  d4 es8 (d) d4 es8 (d) |
  d2 es4. (c8) |
  bes4. (d8) c4. (a8) |
  bes4 
}


\book {

  \score {
    <<
      \new Staff = "right" \with {
        midiInstrument = "string ensemble 1"
        \remove Time_signature_engraver
      } \withBrackets
    >>

    \layout { }
    \midi {
      \tempo 2=100
    }
  }

}

\book {

  \score {
    <<
      \new Staff = "right" \with {
        midiInstrument = "string ensemble 1"
        \remove Time_signature_engraver
      } \withoutBrackets
    >>

    \layout { }
    \midi {
      \tempo 2=100
    }
  }

}


\book {

  \score {
    <<
      \new Staff = "right" \with {
        midiInstrument = "string ensemble 1"
        \remove Time_signature_engraver
      } \withoutBracketsAbbr
    >>

    \layout { }
    \midi {
      \tempo 2=100
    }
  }

}

\book {

  \score {
    <<
      \new Staff = "right" \with {
        midiInstrument = "string ensemble 1"
        \remove Time_signature_engraver
      } \cadentialPassage
    >>

    \layout { }
    \midi {
      \tempo 2=100
    }
  }

}

