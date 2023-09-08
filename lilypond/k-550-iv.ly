\version "2.24.2"

\header {
  tagline = ##f
}

\include "./functions.ly"

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
  }
}

global = {
 \key g \minor
 \time 2/2
}

excerptA = \relative d' {
 \global
 \partial 4
 \setAnalysisBracket 
 \override HorizontalBracket.Y-offset = #6.2
 d \p \startGroup ^\markup \bold { {\fontsize #5.0 P}\sub{\fontsize #2.0 HEAD} } (g) bes-. d-. g-.
 bes2 (a4) \stopGroup 
   cis,8 ^\markup \bold { {\fontsize #5.0 P}\sub{\fontsize #2.0 CADENTIAL} } \f \startGroup e
 \repeat unfold 2 { d (fis) e cis }
 d4 \stopGroup
}


\book {
  \paper {
    % #(set-paper-size "page size name" )
    indent = #0
    ragged-last = ##t
    print-page-number = ##f
  }
  \score {
    \new Staff
    \with {
      %\remove Time_signature_engraver
    }
    \excerptA
    \layout {}
    \midi {
      \tempo 2 = 120
    }
  }
}

excerptB = \relative d' {
 \global
 \partial 4
 \setAnalysisBracket 
 d \p (g) bes-. d-. g-.
 bes2 (a4) 
}


\book {
  \paper {
    % #(set-paper-size "page size name" )
    indent = #0
    ragged-last = ##t
    print-page-number = ##f
  }
  \score {
    \new Staff
    \with {
      %\remove Time_signature_engraver
    }
    \excerptB
    \layout {}
    \midi {
      \tempo 2 = 120
    }
  }
}