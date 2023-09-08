\version "2.24.2"

\include "../../lilypond-page-sizes/paper-sizes.ily"

\header {
  tagline = ##f 
}

\layout {
  \context {
    \Staff
    \remove Time_signature_engraver
  }
}

global = {
    \key g \minor
    \time 2/2
}

excerptA = \relative d'' {
 \global
 \partial 4
 d8 \p (cis) |
 cis4-. d8 (cis) cis4-. d8 (cis) |
 cis4 (a') r4 a8 (gis) |
 fis4-. fis8 (e!) d4-. d8 (cis) |
 bis4 bis r4
}

\book {
  \paper {
    #(set-paper-size "size 6-1")
    indent = 0 \in
  }
  \score {
    \new Staff \excerptA
    \layout {}
    \midi {}
  }
}

excerptB = \relative cis'' {
  \global 
  \partial 4
  cis8 (b) |
  b4-. cis8 (b) b4-. cis8 (b) |
  b4 (gis') r g8 (fis) |
  eis4-. eis8 (d) cis4-. cis8 (b) |
  ais4 ais r
}

\book {
  \paper {
    #(set-paper-size "size 6-1")
    indent = 0 \in
  }
  \score {
    \new Staff \excerptB
    \layout {}
    \midi {}
  }
}

excerptC = \relative b' {
  \global
  \partial 4
  b8 (a!) |
  a4 b8 (a) a4 b8 (a) |
  a4 (fis') r fis8 (e) |
  dis4 dis8 (cis) b-. \f 
}


\book {
  \paper {
    #(set-paper-size "size 5-1")
    indent = 0 \in
  }
  \score {
    \new Staff \excerptC
    \layout {}
    \midi {}
  }
}