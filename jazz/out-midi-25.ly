\version "2.18.2"


sop = { c'' c'' g' gis' e' d' g' g' }
alto = { e' dis' g' d' c' d' d' e' }
tenor = { c' gis b b a c' b c' }
bass = { c gis d e a fis g c }

\score {
  \new PianoStaff  <<
    \new Staff = "upper" <<
      \clef "treble"
      \set Staff.midiInstrument = "ocarina"
      \new Voice = "sop" { \voiceOne \sop }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Staff = "lower" <<
      \clef "bass"
      \set Staff.midiInstrument = "ocarina"
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \layout { }
  \midi { }
}

