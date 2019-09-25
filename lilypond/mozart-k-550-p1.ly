\version "2.18.2"

\header {
  % Remove default LilyPond tagline
  tagline = ##f
  %ragged-right = ##t
  %ragged-last = ##t
}

#(set-global-staff-size 20)


#(set! paper-alist (cons '("my size" . (cons (* 5.0 in) (* 0.75 in))) paper-alist))

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


right = \relative c'' {
  \global
  es8 (d) |
  d4 es8 (d) d4 es8 (d) |
  d4 (bes') r bes8 (a) |
  g4 g8 (f) es4 es8 (d) |
  c4 c r
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
