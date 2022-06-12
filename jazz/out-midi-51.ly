\version "2.18.2"


sop = { c'' g' c'' c'' g' gis' g' c'' }
alto = { e' d' c' f' d' f' d' e' }
tenor = { c' b c' a b gis b c' }
bass = { c g gis a g f g c }

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

