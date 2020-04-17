\version "2.20.0"

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

global = {
  \key g \minor
  \time 2/2

}

colorNotes = #(define-music-function
                 (col notes)
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


blueText = \override TextScript.color = #blue


right = \relative f'' {
  \time 2/2
  \key g \minor
  \context Voice = "2" { f2. \p _\markup \italic "Strings" (e4 }
  << 
    { \stemUp \blueText \colorNotes #blue { 
       es2. ^\markup \italic "Woodwinds" (f16 es d c bes4) 
      }
    }
    \\
   \context Voice="2" { \stemDown es!4) s s2 s4 }
  >>
  bes4-. bes (c) |
  d4. (es8) c4 r |
  g'2. (fis4 |
  f! e es d) |
  c (es2 a,4) |
  bes
}

\score {
  <<
    \new Staff = "right" \with {
      midiInstrument = "synthstrings 2"
      \remove Time_signature_engraver
    } \right
  >>

  \layout { }
  \midi {
    \tempo 2=100
  }
}
