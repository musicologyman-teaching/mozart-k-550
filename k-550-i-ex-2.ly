\version "2.18.2"

\header {
  % Remove default LilyPond tagline
  tagline = ##f
  ragged-right = ##t
  ragged-last = ##t
}

#(set! paper-alist (cons '("my size" . (cons (* 7 in) (* 1.2 in))) paper-alist))

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

colorNotes = #(define-music-function
                 (parser location col notes)
                 (color? ly:music?)
                 #{
                   \override NoteHead.color = #col
                   \override Stem.color = #col
                   \override Beam.color = #col
                   \override Slur.color = #col
                   \override Accidental.color = #col
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
  <<
      {s1 \blueText \colorNotes #blue { es2. ^\markup { \italic "Woodwinds" } (f16 es d c  bes4) } s s2 | s1 * 4 s1 }
      \\
      { f'2. \p _\markup { \italic "Strings" } (e4 es!) s s2 |
       \override Script.direction = #UP
       \once \override Rest.transparent = ##t
       r4 bes-. \slurNeutral bes (c) d4. (es8) c4 b4\rest
       g'2. (fis4 f e es d) |
       c (es2 \stemUp a,4) \stemDown bes4 } >>
   \bar ""




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
