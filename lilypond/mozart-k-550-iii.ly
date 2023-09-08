\version "2.24.2"

\header {
  tagline = ##f
}\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}

\paper {
  indent = 0 \in
}

\layout {
  \context {
    \Staff
    \remove Time_signature_engraver
  }
}

global_minuet = {
  \key g \minor
  \time 3/4
}

global_trio = {
  \key g \major
  \time 3/4
}

exANotes = {
  d4 \f
  g2 bes4 ~
  bes a8 g fis a |
  g4
}

exA = \relative d' {
  \global_minuet
  \partial 4
  \exANotes
}

exANoDynamics = \relative d' {
  \global_minuet
  \partial 4
  d4
  g2 bes4 ~
  bes a8 g fis a |
  g4
}

exBNotes = {
  g4
  bes2 d4~
  d c8 bes a c |
  bes4
}

exB = \relative d' {
  \global_minuet
  \partial 4
  \exBNotes
}

exCNotes = {
  d4
  g2 bes4 ~
  bes a8 f!  e! g |
  f4
}

exC = \relative d'' {
  \global_minuet
  \partial 4
  \exCNotes
}

exDNotes = {
  d4
  g2 bes4 ~
  bes a8 f!  e! g |
  f4 e!8 d cis e |
  d4 c!8 bes a c |
  bes4
}

exD = \relative d'' {
  \global_minuet
  \partial 4
  \exDNotes
}

exE = \relative d' {
  \global_minuet
  \partial 4
  \exANotes d 
  \exBNotes g 
  \relative d''
  \exDNotes
}

\book {
  \score {
    \new Staff \exA
    \layout {}
    \midi { \tempo 2.=60 }
  }
}

\book {
  \score {
    \new Staff \exB
    \layout {}
    \midi { \tempo 2.=60 }
  }
}

\book {
  \score {
    \new Staff \exC
    \layout {}
    \midi { \tempo 2.=60 }
  }
}

\book {
  \score {
    \new Staff \exD
    \layout {}
    \midi { \tempo 2.=60 }
  }
}


\book {
  \score {
    <<
      \new Staff \with { 
        \remove Time_signature_engraver
      } \exANoDynamics
      \new Staff \exB
      \new Staff \exC
    >>
    \layout {}
    \midi { \tempo 2.=60 }
  }
}

#(set! paper-alist
  (cons '("narrower" . (cons (* 5 in) (* 3 in))) paper-alist))


\book {
  \paper {
    #(set-paper-size "narrower")
    indent = 0 \in
    ragged-right = ##t
  }
  \score {
    \new Staff 
    \with { \consists Time_signature_engraver } 
    <<
      \exE
      \new Dynamics \repeat unfold 2 { s4 s2. * 2 s2 \bar "" \break } 
    >>
    \layout {}
    \midi { \tempo 2.=60 }
  }
}


\book {
  \paper {
    #(set-paper-size "narrower")
    indent = 0 \in
    ragged-right = ##t
    ragged-last-bottom = ##f
  }
  \score {
    \new Staff 
    \with { \consists Time_signature_engraver } 
    <<
      { \exE 
        \relative bes'' { bes4 a gis g! f e (g) cis, d r } }
      \new Dynamics {
        \repeat unfold 2 { s4 s2. * 2 s2 \bar "" \break} 
      }
    >>
    \layout {}
    \midi { \tempo 2.=60 }
  }
}
