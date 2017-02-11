module Skeleton exposing (skeleton)

import Html exposing (..)
import Html.Attributes exposing (..)
import Tuple exposing (first, second)


(=>) = (,)


skeleton tabName content =
  div []
    (header tabName :: content ++ [footer])

-- HEADER

header name =
  div [ id "tabs" ]
    [ a [ href "/"
        , style
            [ "position" => "absolute"
            , "left" => "1em"
            , "top" => "1em"
            ]
        ]
        [ img [ src "/assets/logo.svg", style [ "width" => "24px" ] ] []
        ]
    , ul [] (List.map (tab name) [ ("examples", "예제"), ("docs", "문서"), ("community", "커뮤니티"), ("blog", "블로그") ])
    ]





tab currentName name =
  li []
    [ a [ classList [ "tab" => True, "current" => (currentName == first name ) ]
        , href ("/" ++ first name)
        ]
        [ text (second name) ]
    ]



-- FOOTER


footer =
  div [class "footer"]
    [ text "All code for this site is open source and written in Elm. "
    , a [ class "grey-link", href "https://github.com/elm-lang/elm-lang.org/" ] [ text "Check it out" ]
    , text "! — © 2012-2017 Evan Czaplicki"
    ]

