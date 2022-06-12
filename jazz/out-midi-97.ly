\version "2.18.2"


sop = { c'' c'' ais' c'' ais' a' g' c'' }
alto = { g' a' f' a' f' f' d' e' }
tenor = { e' c' d' f' d' d' b c' }
bass = { c e ais f ais f g c }

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

