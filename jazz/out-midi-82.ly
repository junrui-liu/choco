\version "2.18.2"


sop = { c'' g' c'' c'' gis' a' g' c'' }
alto = { e' e' f' c' d' d' g' e' }
tenor = { c' b a c' b d' b c' }
bass = { c e a gis f f g c }

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

