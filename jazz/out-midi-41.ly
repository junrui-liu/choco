\version "2.18.2"


sop = { c'' c'' gis' gis' a' gis' b' c'' }
alto = { c'' gis' d' dis' d' gis' d' e' }
tenor = { e' c' b c' d' gis g g }
bass = { c gis b gis f f g c }

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

