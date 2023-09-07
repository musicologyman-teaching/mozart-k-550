\version "2.20.0"

global = {
  \time 2/2
  \key g \minor
}

\layout {
  \context {
    \Staff
    \remove Time_signature_engraver
  }
}



\score {
  \new Staff \relative f'' { \global \partial 4 r8 f es4-. g-. bes-. r }
  \layout {}
  \midi { \tempo 2 = 100 }
}


\score {
  \new Staff \relative d'' { \global d4-. f-. bes-. }
  \layout {}
  \midi { \tempo 2 = 100 }
}

\score {
  \new Staff \relative f'' { \global \partial 4 
                             r8 d c4-. es-. g-. }
  \layout {}
  \midi { \tempo 2 = 100 }
}


\score {
    \new Staff \relative f'' { \global \partial 4 c-. bes-. d-. f-.  }
  \layout {}
  \midi { \tempo 2 = 100 }
}