\version "2.22.0"

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

exA = \relative d' {
  \global_minuet
  \partial 4
  d4 \f
  g2 bes4 ~
  bes a8 g fis a |
  g4
}

exB = \relative d' {
  \global_minuet
  \partial 4
  g4 
  bes2 d4~ 
  d c8 bes a c |
  bes4
}

exC = \relative d'' {
  \global_minuet
  \partial 4
  d4 
  g2 bes4 ~ 
  bes a8 g!  f! a |
  f4
}

exD = \relative d'' {
  \global_minuet
  \partial 4
  d4
  g2 bes4 ~ 
  bes a8 g!  f! a |
  f4 e!8 d cis e |
  d4 c!8 bes a c |
  bes4
}

\score {
  \new Staff \exA
  \layout {}
  \midi {}
}

\score {
  \new Staff \exB
  \layout {}
  \midi {}
}

\score {
  \new Staff \exC
  \layout {}
  \midi {}
}

\score {
  \new Staff \exD
  \layout {}
  \midi {}
}
  
