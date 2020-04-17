\version "2.20.0"


\header {
  tagline = ##f
}

#(set! paper-alist (cons '("size A" . (cons (* 7 in) (* 1.25 in))) paper-alist))
#(set! paper-alist (cons '("size B" . (cons (* 4 in) (* 1.25 in))) paper-alist))
#(set! paper-alist (cons '("size C" . (cons (* 7 in) (* 2.25 in))) paper-alist))
#(set! paper-alist (cons '("size D" . (cons (* 5 in) (* 1.75 in))) paper-alist))
#(set! paper-alist (cons '("size E" . (cons (* 7 in) (* 2.0 in))) paper-alist))
#(set! paper-alist (cons '("size F" . (cons (* 6 in) (* 2.25 in))) paper-alist))
#(set! paper-alist (cons '("size G" . (cons (* 7 in) (* 2.0 in))) paper-alist))
#(set! paper-alist (cons '("size H" . (cons (* 7 in) (* 5.0 in))) paper-alist))
#(set! paper-alist (cons '("size I" . (cons (* 5 in) (* 1.25 in))) paper-alist))
#(set! paper-alist (cons '("size J" . (cons (* 6 in) (* 1.25 in))) paper-alist))

globalI = {
  \key g \minor
  \time 2/2
}

excerptA = \relative bes'' {
  \globalI
  bes1 \f
  f2.  r8 f8 |
  es4-! g-! bes-! r |
  d,-! f-! bes-! r8 d, |
  c4-! es-! g-! c,-! |
  bes-! d-! f-!
}

excerptB = \relative bes {
  \globalI
  bes8 \f d \repeat unfold 3 { bes d }
  \repeat unfold 4 { a c }
  \repeat unfold 4 { g bes }
  \repeat unfold 4 { f bes }
  \repeat unfold 4 { es, g }
  \repeat unfold 2 { d f } d [f]
}

excerptC = \relative c' {
 \globalI
 <bes g>8 \p _\markup \italic Violas ^\markup \bold { Molto Allegro } <bes g> <g' bes,> <g bes,>
   \repeat unfold 3 { <bes, g> <bes g> <g' bes,> <g bes,> }
}

excerptF = \relative c' {
 \globalI
 \partial 4
 \repeat unfold 2 { d8 d d2 r4 }
 \repeat unfold 2 { d8 d d4 }
 d8 d d2
}

\book {
  \paper {
    #(set-paper-size "size A" )
    indent = #0
    ragged-last = ##f
  }
  \score {
    <<
      \new Staff
      \with { midiInstrument = #"acoustic grand" }
      \excerptA
    >>
    \layout {
      \context {
        \Score
        \remove Bar_number_engraver
      }
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 2 = 100 }
  }
}

\book {
  \paper {
    #(set-paper-size "size C" )
    indent = #0
    ragged-last = ##f
  }
  \score {
    <<
      \new Staff
      \with { midiInstrument = #"acoustic grand" }
      { \clef bass \excerptB }
    >>
    \layout {
      \context {
        \Score
        \remove Bar_number_engraver
      }
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 2 = 100 }
  }
}


\book {
  \paper {
    #(set-paper-size "size C" )
    indent = #0
    ragged-last = ##f
  }
  \score {
    <<
      \new Staff
      \with { midiInstrument = #"acoustic grand" }
      { \clef bass \excerptB }
      \new Staff
      \with { midiInstrument = #"acoustic grand" }
      { \clef bass \transpose c c, \excerptB }
    >>
    \layout {
      \context {
        \Score
        \remove Bar_number_engraver
      }
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 2 = 100 }
  }
}


\book {
  \paper {
    #(set-paper-size "size C" )
    indent = #0
    ragged-last = ##f
  }
  \score {
    <<
      \new Staff
      \with { midiInstrument = #"acoustic grand" }
      \excerptA
      \new Staff
      \with { midiInstrument = #"acoustic grand" }
      { \clef bass \excerptB }
      \new Staff
      \with { midiInstrument = #"acoustic grand" }
      { \clef bass \transpose c c, \excerptB }
    >>
    \layout {
      \context {
        \Score
        \remove Bar_number_engraver
      }
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 2 = 100 }
  }
}

\book {
  \paper {
    #(set-paper-size "size B" )
    indent = #0
    ragged-last = ##t
  }
  \score {
    <<
      \new Staff
      \with { midiInstrument = #"string ensemble 2" }
      \excerptC
    >>
    \layout {
      \context {
        \Score
        \remove Bar_number_engraver
      }
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 2 = 100 }
  }
}


\book {
  \paper {
    #(set-paper-size "size J" )
    indent = #0
    ragged-last = ##t
  }
  \score {
    <<
      \new Staff
      \with { midiInstrument = #"string ensemble 2" }
      \excerptF
    >>
    \layout {
      \context {
        \Score
        \remove Bar_number_engraver
      }
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 2 = 100 }
  }
}