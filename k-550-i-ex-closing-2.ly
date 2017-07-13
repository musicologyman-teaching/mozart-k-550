\version "2.18.2"

\header {
  % Remove default LilyPond tagline
  tagline = ##f
  %ragged-right = ##t
  %ragged-last = ##t
}

#(set-global-staff-size 11)


#(set! paper-alist (cons '("my size" . (cons (* 3.5 in) (* 1 in))) paper-alist))

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


right = \relative c'' {
  \global
  g'8 ^\markup { \italic { oboe  } } _\p (f) f4-. g8 (f) f4-. r
  r2 r4 g8 (f) f4-. g8 (f) f4-. r
  s1 
  \bar ""
}

left = \relative c'' {
 \global
  s4
  r2 r4 g8 \p ^\markup { \italic { bassoon } } (f) f4-. g8 (f) f4-. r
  r2 r4 g8 (f) f4-. g8 (f) f4-. r
}

\score {
  \new GrandStaff
  \new StaffGroup \with {
   \remove Span_bar_engraver
  }
  <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
      \remove Time_signature_engraver
    } \right
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
      \remove Time_signature_engraver
    } \left
  >>

  \layout { }
  \midi {
    \tempo 2=100
  }
}
