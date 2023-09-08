\version "2.24.2"

\header {
  % Remove default LilyPond tagline
  tagline = ##f
  %ragged-right = ##t
  %ragged-last = ##t
}

#(set-global-staff-size 11)

\layout {
  indent = 0 \in
  \context {
    \Score \remove "Bar_number_engraver"
  }
  \context {
    \Staff \RemoveEmptyStaves
  }
}

global = {
  \key g \minor
  \time 2/2
  \partial 2
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

upperStrings = \relative c'' {
  \global
  \setAnalysisBracket
  bes'2 ^\markup { \italic { violins  } } _\p ~ bes (a)
  r bes ~ bes (a)
  s1 \bar ""
}

lowerStrings = \relative c {
  \global
  \clef bass
  \set doubleSlurs = ##t
  s2
  \override TextScript.whiteout = ##t
  r2 <es, es'> \p ^\markup { \italic { "violas, cellos, basses" } } ~ <es es'> (<d d'>4 ) r
  r2 <es es'> ~ <es es'> (<d d'>4) r4
}

upperWW = \relative c'' {
  \global
  r4
  g'8 ^\markup { \italic { oboe  } } _\p (f) f4-. g8 (f) f4-. r
  r2 r4 g8 (f) f4-. g8 (f) f4-. r
  s1
  \bar ""
}

lowerWW = \relative c'' {
  \global
  s2
  r2 r4 g8 \p ^\markup { \italic { bassoon } } (f) f4-. g8 (f) f4-. r
  r2 r4 g8 (f) f4-. g8 (f) f4-. r
}

\score {
  <<
    \new StaffGroup \with { \remove Span_bar_engraver }
    <<
      \new Staff = "upperWW" \with {
        midiInstrument = "oboe"
        \remove Time_signature_engraver
      } \upperWW
      \new Staff = "lowerWW" \with {
       midiInstrument = "bassoon"
        \remove Time_signature_engraver
      } \lowerWW
    >>
    \new StaffGroup \with { \remove Span_bar_engraver }
    <<
      \new Staff = "upperStrings" \with {
       midiInstrument = "synthstrings 2"
        \remove Time_signature_engraver
      } \upperStrings
      \new Staff = "lowerStrings" \with {
        midiInstrument = "synthstrings 2"
        \remove Time_signature_engraver
      } \lowerStrings
    >>
  >>

  \layout { }
  \midi {
    \tempo 2=100
  }
}

