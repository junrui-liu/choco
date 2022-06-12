\version "2.18"

\include "roman_numeral_analysis_tool.ily"


sop = { c'' gis' c'' gis' a' dis' g' e' }
alto = { e' dis' e' d' a c' b e' }
tenor = { c' c' a e a gis b g }
bass = { c gis c e c gis g c }

analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = #"C:"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { I 7 }
\markup \rN { bVI 4 2 }
\markup \rN { vi 6 5 }
\markup \rN { V/vi 7 }
\markup \rN { vi 6 5 }
\markup \rN { bVI 7 }
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
