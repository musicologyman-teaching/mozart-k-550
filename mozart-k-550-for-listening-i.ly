\version "2.18.2"

\include "functions.ily"

\header {
  tagline = ##f
}

#(set! paper-alist (cons '("my size" . (cons (* 8.5 in) (* 2.5 in))) paper-alist))

\paper {
  #(set-paper-size "my size" )
  print-page-number = ##f
  max-systems-per-page = #1
}

\layout {
  indent = 0 \in
  \context {
    \Score
    %\remove "Bar_number_engraver"
  }
}

\paper {
  ragged-last-bottom = ##f
  ragged-bottom = ##f
}

main = \relative c'' {
  \clef treble
  \key g \minor
  \time 2/2

  \tempo "Molto Allegro"
  <<
    {
      r2 r4 es8 ^\markup \column {
        \line \huge \bold { P\super{1}}
        \line \italic { violins }
      } (d)
      d4 es8 (d) d4 es8 (d) |
    }
    \new Staff {
      \key g \minor  g,,8 \p ^\markup \italic "violas" g es' es g, g es' es  |
      \once \override TextScript #'Y-offset = #-1.0
      \stopStaff s1 ^\markup \italic "etc."
    }
  >>


  d'4 (bes') r bes8 (a) |
  g4 g8 (f) es4 es8 (d) |
  c4 c r d8 (c) |

  %measure 6
  c4 d8 (c) c4 d8 (c) |
  c4 (a') r a8 (g) |
  fis4 fis8 (es) d4 d8 (c) |
  bes4 bes r bes'8 (a) |
  a4 (c fis, a) |
  g (d) r bes'8 (a) |
  a4 (c fis, a) |
  g4 (bes a8 g f es) |


  %measure 14
  <<
    \new Staff \with {
      \remove Time_signature_engraver
      alignAboveContext = #"main"
    }
    {
      \key g \minor
      \clef "treble"

      r4 fis \p ^\markup \italic "woodwinds" (g a
      bes c8 bes a4 g fis) r cis'2 \f
      (d4) r cis2
      (d4) r cis2
      (d4) cis-! d-! cis-! |
      d2 \clef bass c,, \p ^\markup \italic "bassoon"
      (bes2 a)
    }
    {

      d'1 (cis1 d2)
      r4 d,8 \f d |

      %measure 17
      d2 r4 d8 d |
      d2 r4 d8 d |
      d4 d8 d d4 d8 d |
      d2 r4 es'8 \p (d) |
      d4 es8 (d) d4 es8 (d) |
    }
  >>



  %measure 22
  d4 (bes') r bes8 (a) |
  g4 g8 (f) es4 es8 (d) |
  c4 c r f8 (es) |
  es4 f8 (es) es4 f8 (es) |
  es4 (c') r c8 (bes) |

  %measure 27
  a4 a8 (g) f4 f8 (es) |
  bes'1 \f ^\markup \column { \line \huge { \bold { P \super 2 } } \line { \italic "[full orchestra plays here]" } }|
  f2. r8 f |
  es4-! g-! bes-! r |
  d,-! f-! bes-! r8 d, |

  %measure 32
  c4-! es-! g-! c,-! |
  bes-! d-! f-! r8 f |
  \repeat unfold 3 { e8 f g a bes c des f, }

  %measure 37
  e f g a bes c des e, |
  f2 c'4-! a-! |
  des2 e,4-! g-! |
  f2 c'8 a c a |
  des bes des bes e, g e g |
  f4 r f, r \break|

  %measure 43
  \once \override MultiMeasureRestNumber #'text = #"1"
  R1 * 1 ^\markup \italic "\"medial caesura\""


  <<
    \new Staff \with {
      \remove Time_signature_engraver
      alignAboveContext = #"main"
    }
    {
      \key g \minor
      \shiftTextScriptHorizontal #-3.0
      R1 ^\markup \huge \bold { S - theme }
      \shiftTextScriptHorizontal #2.0
      es'2. \p _\markup \italic "woodwinds" (f16 es d c
      bes4) r r2 |
      R1 * 3


      R1
      bes8 ^\markup \italic "woodwinds" (a c bes d c es d) |
      f2. (e4
      es) r r2 |
      r4 bes-. bes (c) |
      d4. (es8) c4-. r |
      g'2. (fis4 |
      f e es d) |
      r4 ^\markup \italic "flute" g2 (aes4) |
      \repeat unfold 3 { r4 g2 (aes4) }
    }
    {
      f2. \p _\markup \italic { violins } (e4
      es!4) r4 r2 |
      r4 bes-. bes (c) |
      d4. (es8) c4-. r |
      g'2. (fis4 |
      f! e es d) \break |
      c (es2 a,4) |
      bes4 r r2 |
      R1
      es2. (f16 es d c
      bes4) r r2 |
      R1
      g2. (fis4 |
      f e es d) |
      \repeat unfold 4 { des2. (c4) }
    }
  >>

  % measure 61
  des8 des' des des \crescTextCresc des \< des des des |
  des des' des des des des des des |
  d!1 \f
  a2.. \trill (g16 a) |
  bes4 d,,8 \sf ^\markup \bold \huge { Closing section } d d d es es |
  e e f f fis fis g g |
  aes4 r8. aes16 g4 r8. g16 |
  es'4 r8. es16 d4 r8. d16 |
  g2 ~ g8 f-. \p es-. d-. |
  c-. bes-. a-. g-. f-. es-. d-. c-. \break |


  <<
    {
      bes4 r <<
        \colorVoice #magenta {
          \shiftTextScriptHorizontal #2.0
          bes''2 ^\p ^\markup \italic "violins" ~ bes2 (a)
          \blackRest
          b,2\rest bes'2 ~ bes (a)
        } \\
        \colorVoice #blue {
          r4
          \shiftTextScriptHorizontal #2.0
          g8 _\markup \italic "clarinet" \p (f) f4-. g8 (f) f4-. s |
          s2 r4 g8 (f) f4-. g8 (f) f4-. s
        }
      >>
      r2 r4 es'8 \f (d) \break |
    }
    \new Staff \with {
      \remove Time_signature_engraver
    }
    {
      \clef bass
      \key g \minor
      s1 |
      r2  <<
        \colorVoice #blue {
          r4
          \shiftTextScriptHorizontal #2.0
          g,,8 ^\p ^\markup \italic "bassoon" (f) f4-. g8 (f) f4-. s
          s2 r4 g8 (f) f4-. g8 (f) f4-. s
        } \\
        \colorVoice #magenta {
          \shiftTextScriptHorizontal #2.0
          es,2 \p _\markup \italic { violas & cellos } ~
          es (d4) \blackRest d4\rest |
          d2\rest es ~
          es (d4) d\rest |
        }
      >>
    }
  >>

  %measure 77
  d'''4 es8 (d) d4 es8 (d) |
  d2 es4. (c8) |
  bes4. (d8) c4. (a8) |
  bes4 r

  <<
    {
      r2
      <<
        \colorVoice #magenta {

          \override Rest #'color = #black
          bes,2\rest
          \shiftTextScriptHorizontal #2.0
          es'2 ^\p ^\markup \italic "violins"
          ~ es (d4) bes,\rest
          bes2\rest
          \voiceTwo
          es2 ~ _\markup \italic "violins"
          es2 (d4)
          \stemDown
          \slurUp
          \revert NoteHead.color
          \revert Stem.color
          \revert Slur.color
          \revert Beam.color
          \revert DynamicText.color
          es'8 \f ^\markup \italic "violins" (d)
        } \\
        \colorVoice #blue {
          s2 r4
          \shiftTextScriptHorizontal #2.0
          g,8 _\p _\markup \italic "clarinet" (f)
          f4-. g8 (f) f4-. s4
          \voiceOne
          s2 s4 g8 ^\markup \italic "clarinet" (f)
          f4-. g8 (f) f4-. s
        }
      >>

    }
    \new Staff
    \with { \remove Time_signature_engraver }
    {
      \key g \minor
      <<
        \colorVoice #blue {
          \voiceTwo
          r4
          \shiftTextScriptHorizontal #2.0
          g,8 _\p _\markup \italic "bassoon" (f)
          f4-. g8 (f) f4-. s |
          \voiceOne
          s2 r4
          g8 ^\markup \italic "bassoon" (f) |
          f4-. g8 (f) f4-. s |

        } \\
        \colorVoice #magenta {
          \voiceOne
          \shiftTextScriptHorizontal #2.0
          bes2 ^\p ^\markup \italic "violas & cellos"  ~
          \blackRest
          bes (a4) bes\rest
          \voiceTwo
          bes2\rest
          bes, _\markup \italic "violas & cellos" ~
          bes (a4) bes'\rest
        }
      >>
      \stopStaff
      s1
    }
  >>
  d'4 es8 (d) d4 es8 (d) |
  d2 es4. (c8) |
  bes4. (d8) c4. (a8) |
  bes f d' c bes a g f |
  e d c bes a g f es |
  d4 f' g a, |
  bes8 f d' c bes a g f |
  es d c bes a c f es |
  d4 f' g a |
  bes g f a, |

  % measure 95
  bes8 (d) f-. bes-. \repeat unfold 2 {
    a (f) c'-. a-. |
    bes-. f-. d'-. bes-.
  } a (f) c'-. a-. |
  \repeat unfold 2 { bes (d) c-. a-. } |
  bes4 r r2 |
  fis4 r r2 \endRepeat \break

  %measure 101
  g4 r gis r |
  <<
    {
      d'1 ^\markup \italic woodwinds \p
      (cis2 b a gis)
      fis4 s
    }
    \\
    {
      s1
      s2 s4 d8 _\markup \italic violins \p (cis)
      cis4-. d8 (cis) cis4-. d8 (cis)
      cis4 (a')
    }
  >>
  r4 a8 ^\markup \italic "(violins)" (gis) |
  fis4-. fis8 (e) d4-. d8 (cis) |

  %measure 107
  bis4 bis r cis8 (b) |
  b4-. cis8 (b) b4-. cis8 (b) |
  b4 (gis') r gis8 (fis8)
  eis4 eis8 (d8) cis4 cis8 (b8)
  ais4 ais4 r4 b8 (a!8) |
  a4 b8 (a8) a4 b8 (a8) |
  a4 (fis'4) r4 fis8 (e8) |

  %measure 114
  <<
    {
      dis4 dis8 (cis8) b!-. \f d-. fis-. a,-. |
      g-. b-. e-. g,-. fis-. a-. dis-. fis,-. |
      g-. b-. cis-. dis-. e-. b-. e-. fis-. |
      g-. e!-. fis-. gis-. a-. e-. a-. b-. |
      c4-. a,-. r bes'8 (a) |
      a4 bes8 (a) bes8 (a) a4 |
      a (f') r f8 (e) |
      d4 d8 (c) bes!4 bes8 (a) |
      g-. d-. bes!-. c-. d-. b-. d-. f,-. |
      e-. g-. c-. e,-. d-. f-. b-. d,-. |

      e g a b c g c d |
      e c d e f c f g |
      a4 f, r g'8 (f) |
      f4 g8 (f) f4 g8 (f) |


    }
    \new Staff \with {
      \remove Time_signature_engraver
    }
    {
      \clef treble
      \key g \minor

      s2 s4
      \shiftTextScriptHorizontal #-12.0
      c,8 \f ^\markup \italic { violas and cellos} (b) |
      b4 c8 (b) b4 c8 (b) |
      b4 (g'4)  r g8 (fis) |
      e4 e8 (d) c4 c8 (b) |
      \clef bass
      a8-. b-. c-. b-. a-. bes-. g-. a-. |
      f-. a-. d-. f,-. e-. g-. cis-. e,-. |
      d-. a'-. b-. cis-. d-. a-. d-. e-. |
      \clef treble
      f-. d-. e-. fis-. g-. d-. g-. a-. |
      bes4 \clef bass g, r a8 (g) |
      g4 a8 (g) g4 a8 (g) |
      g4 (e') r e8 (d) |
      c4 c8 (bes!) a4 a8 (g) |
      f-. g-. a-. g-. f-. g-. es-. f-. |
      \stopStaff
      \once \override TextScript.Y-offset = #0.0
      \once \override TextScript.X-offset = #1.0
      s1 ^\markup \italic "etc."
    }
  >>

  f''4 (d') r d8 (c) |
  bes4 bes8 (a) g4 g8 (f) |
  e4 (c') r c8 (bes) |
  a4 a8 (g) fis4 fis8 (e) |
  d4 (bes') r bes8 (a) |
  g4 g8 (f!) e4 e8 (d) |
  cis4 (a') \repeat unfold 2 { r bes8 (a) |
                               a4 bes8 (a) a4 bes8 (a) |
                               a4-! a-! } r4 bes8 \p (a) |

  % measure 139
  <<
    \new Staff \with {
      \remove Time_signature_engraver
    }
    { \clef treble
      \key g \minor
      r2 r4 f8 \p  ^\markup \italic "flute" (es!) |
      es4 f8 (es) es4 es |
      r2 r4 ges8 (f) |
      f4 ges8 (f) f4 f |
      r2 r4 ges8 (f) |
      f4 ges8 (f) f4 f |
      r2 r4 aes8 (g) |
      g4 aes8 (g) g4 g |
      R1 |
      r4 b8 (c) c4 r |
      R1 |
      r4 es8 (d) d4 r |
      R1
      r4 g8 (fis) fis4 r |
    }

    { a,4 bes8 (a) a4 bes8 (a) |
      a4 a r c8 (bes) |
      c4 c8 (bes) bes4 c8 (bes) |
      bes4 bes r c8 (b) |
      c4 c8 (b) b4 c8 (b) |
      b4 b r d8 (c) |
      d4 d8 (c) c4 d8 (c) |
      c4 c r bes8 (a) |
      bes4 bes8 (a) a4 bes8 (a) |
      a4 a r g8 (fis) |
      g4 g8 (fis) fis4 g8 (fis) |
      fis4 fis r es8 (d) |
      es4 es8 (d) d4 es8 (d) |
      d4 d r

    }
  >>
}

\score {
  <<
    \new Staff = "main" \with {
      midiInstrument = "string ensemble 2"
    } \main
  >>

  \layout { }
  \midi {
    \tempo 2=92
  }
}
