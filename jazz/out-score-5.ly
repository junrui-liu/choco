\version "2.18"

\include "roman_numeral_analysis_tool.ily"


sop = { c'' a' c'' b' b' c'' b' c'' }
alto = { g' f' e' g' b' gis' d' e' }
tenor = { e' d' e' b d' gis b g }
bass = { c d c b gis gis g c }

analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = #"C:"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { I 7 }
\markup \rN { ii 4 2 }
\markup \rN { I 7 }
\markup \rN { V 6 5 }
\markup \rN { vii o 4 2 }
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
