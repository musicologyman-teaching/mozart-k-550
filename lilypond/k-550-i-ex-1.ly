\version "2.18.2"

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
  es8 (d) |
  d4 es8 (d) d4 es8 (d) |
  d4 (bes') r bes8 (a) |
  g4 g8 (f) es4 es8 (d) |
  c4 c r %\bar "" \break
    d8 (c) |
  c4 d8 (c) c4 d8 (c) |
  c4 (a') r4 a8 (g) |
  fis4 fis8 (es8) d4 d8 (c) |
  bes4 bes r \bar "" \break
    bes'8 (a) |
  a4 (c fis, a) |
  g (d) r
  << {
    \stemDown
    bes'8 (a) |
  a4 (c fis, a)  |
  g (bes a8 g f! es) |
  \stemUp
  d1 (cis d2) } \\
    { s4 s1 * 2 r4 fis, (g a bes c8 bes a4 g fis) r }
  >>
  \stopStaff
  s2 s1 * 4
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
      midiInstrument = "string ensemble 2"
      \remove Time_signature_engraver
    } \right
  >>

  \layout { }
  \midi {
    \tempo 2=100
  }
}
