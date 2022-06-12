\version "2.18"

\include "roman_numeral_analysis_tool.ily"


sop = { c' g a a gis c' d' e' }
alto = { e g f f gis gis b c' }
tenor = { e e f d f gis g g }
bass = { c e c d c c g c }

analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = #"C:"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { I 7 }
\markup \rN { iii 4 2 }
\markup \rN { IV 6 4 }
\markup \rN { ii 7 }
\markup \rN { iv 6 4 }
\markup \rN { bVI 6 5 }
\markup \rN { V 7 }
\markup \rN { I 7 }

}

\score {
  \new PianoStaff <<
    \new Staff = "upper" <<
      \clef "treble"
      \new Voice = "sop" { \voiceOne \sop }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Staff = "lower" <<
      \clef "bass"
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
      \new Lyrics \with {
        % to control distance of analysis from staff
        \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'((basic-distance . 6.5))
      } \lyricsto "bass" { \analysis }
    >>
  >>
  \layout {
    \context {
      \Score
      % to control horizontal spacing
      \override SpacingSpanner.shortest-duration-space = #6
    }
    \context {
      \Lyrics
      % to control global size
      %\override LyricText.font-size = #-1
    }
  }
  \midi {
     \context {
       \Score
       tempoWholesPerMinute = #(ly:make-moment 72 4)
       }
     }
}
