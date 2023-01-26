\version "2.20.0"


\header {

  % Remove default LilyPond tagline

  tagline = ##f

  %ragged-right = ##t

  %ragged-last = ##t

}


#(set-global-staff-size 11)



#(set! paper-alist (cons '("my size" . (cons (* 2.0 in) (* 0.9 in))) paper-alist))


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

  \partial 2

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

  bes'2 ^\markup { \italic { violins  } } _\p ~ bes (a)

  r bes ~ bes (a)

  s1 \bar ""

}


left = \relative c {

 \global

 \clef bass

 \set doubleSlurs = ##t
  s2

  \override TextScript.whiteout = ##t

  r2 <es, es'> \p ^\markup { \italic { "violas, cellos, basses" } } ~ <es es'> (<d d'>4 ) r

  r2 <es es'> ~ <es es'> (<d d'>4) r4

}


\score {

  \new StaffGroup

  <<

    \new Staff = "right" \with {

      midiInstrument = "synthstrings 2"

      \remove Time_signature_engraver

    } \right

    \new Staff = "left" \with {

      midiInstrument = "synthstrings 2"

      \remove Time_signature_engraver

    } \left

  >>


  \layout { }

  \midi {

    \tempo 2=100

  }

}


%{
convert-ly.py (GNU LilyPond) 2.20.0  convert-ly.py: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
