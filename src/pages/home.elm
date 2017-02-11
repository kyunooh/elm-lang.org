
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown
import String

import Center
import Skeleton



main =
  Skeleton.skeleton "home"
    [ splash
    , featureSection
    , exampleSection
    , userSection
    , getStartedSection
    ]


(=>) = (,)



-- SPLASH


splash =
  div [ class "splash" ]
    [ div [ size 120 16 ] [ text "elm" ]
    , div [ size 26 8 ] [ text "신뢰할 수 있는 웹 어플리케이션을 위한 흥미로운 언어" ]
    , div [ size 16 8 ] [ text "런타임 예외 없이, 좋은 성능의 자바스크립트 코드를 만들어보세요." ]
    , br [] []
    , getStarted
    ]


size height padding =
  style
    [ "font-size" => (toString height ++ "px")
    , "padding" => (toString padding ++ "px 0")
    ]



-- GET STARTED


getStarted : Html msg
getStarted =
  div [ class "get-started" ]
    [ a [ href "/try" ] [ text "온라인으로 사용해보기" ]
    , a [ href "http://guide.elm-lang.org/install.html" ] [ text "설치" ]
    ]


getStartedSection : Html msg
getStartedSection =
  div [ class "splash", style [("margin", "100px 0")] ] [ getStarted ]



-- FEATURES


featureSection : Html msg
featureSection =
  section [class "home-section"]
    [ h1 [] [text "특징"]
    , ul [class "features"] (List.map viewFeature features)
    ]


type alias Feature msg =
  { title : String
  , height : Int
  , image : String
  , link : String
  , description : List (Html msg)
  }


viewFeature : Feature msg -> Html msg
viewFeature feature =
  li
    [ class "feature"
    , style [ ( "min-height", toString feature.height ++ "px" ) ]
    ]
    [ div [class "feature-description"]
        [ h2 [] [text feature.title]
        , p [] feature.description
        ]
    , a [ class "feature-image"
        , href feature.link
        ]
        [ img [src feature.image
              , style [("width", "100%")]
              ] []
        ]
    ]


features : List (Feature msg)
features =
  [ Feature "JavaScript와 상호작용" 100 "/assets/home/embed.png" "/blog/how-to-use-elm-at-work" <|
      [ text "Elm은 JavaScript로 컴파일 되기 때문에 Elm을 시도해보는 건 쉬워요. 여러분이 만든 앱의 작은 부분들을 Elm으로 바꾼 뒤 "
      , a [href "/blog/how-to-use-elm-at-work"] [text "JS코드에 넣어 보세요"]
      , text ". 모든 코드를 재작성하느라 많은 시간을 사용할 필요가 없어요. 자세한 것은"
      , a [href "http://guide.elm-lang.org/interop/"] [text "여기"]
      , text "를 참고하세요."
      ]
  , Feature "런타임 예외가 없어요" 200 "/assets/home/errors.png" "/blog/compilers-as-assistants" <|
      [ text "손수 작성된 자바스크립트와는 달리, Elm은 실제로 런타임 예외를 제공하지 않아요. 대신에 Elm은 컴파일 중 타입 추론을 통해 문제를 발견하고  "
      , a [href "/blog/compilers-as-assistants"] [text "친화적으로 힌트를 알려주죠"]
      , text ". 이 방법은 사용자들에게 절대로 문제가 생기지 않게 해줍니다. NoRedInk는 8만줄이 넘는 Elm코드를 사용했고 1년동안 실제 서비스에서 사용해왔습니다. 그 후 아직까지도 단 한번의 런타임 예외를 발생시킨 적이 없답니다."
      ]
  , Feature "훌륭한 성능" 320 "/assets/home/benchmark.png" "/blog/blazing-fast-html-round-two" <|
      [ text "Elm은 간단하면서도 빠르게 끔 설계된 virtual DOM 구현체를 가졌답니다. Elm에서 모든 값들은 불변형이며, 특히 빠른 Javascript 코드를 생성할 때 도움이 된다는 걸 "
      , a [href "/blog/blazing-fast-html-round-two"] [text "벤치마크에서도"]
      , text " 확인 할 수 있죠."
      ]
  , Feature "강제적인 유의적 버전" 280 "/assets/home/semver.png" "http://package.elm-lang.org" <|
      [ text "Elm은 타입시스템 덕분에 자동적으로 모든 API의 변화를 감지할 수 있죠. 이제 그 정보를 통해 "
      , a [href "http://package.elm-lang.org"] [text "우리의 패키지 카탈로그의"]
      , text " 모든 내용에 대하여 강제적으로 유의적 버전을 준수하게 만들 수 있어요. 정확한 "
      , a [href "https://github.com/elm-lang/elm-package/#version-rules"] [text "유의적 버전으로 "]
      , text "패치 릴리즈시에 끔찍한 일들이 사라지죠!"
      ]
  ]



-- EXAMPLES


exampleSection : Html msg
exampleSection =
  section [class "home-section"]
    [ h1 [] [text "예제"]
    , p [class "home-paragraph", style [("margin-bottom","40px")] ]
        [ text "예제를 통해 배우는 것들은 중요합니다. 그래서 "
        , a [href "/examples"] [text "간단한"]
        , text " 예제와 "
        , a [href "http://builtwithelm.co/"] [text "정교한"]
        , text " 예제들을 "
        , a [href "http://guide.elm-lang.org/"] [text "Elm 소개"]
        , text "에 준비했어요. 여기 멋진 예제들을 확인해보세요!"
        ]
    , fluidList 400 2 examples
    ]


examples : List (List (Html msg))
examples =
  [ example
      "todomvc"
      "https://evancz.github.io/elm-todomvc"
      "https://github.com/evancz/elm-todomvc"
  , example
      "hedley"
      "https://gizra.github.io/elm-hedley"
      "https://github.com/Gizra/elm-hedley"
  , example
      "mantl-ui"
      "https://mantl.io/"
      "https://github.com/CiscoCloud/mantl-ui-frontend"
  , example
      "package"
      "http://package.elm-lang.org"
      "https://github.com/elm-lang/package.elm-lang.org"
  , example
      "flatris"
      "http://unsoundscapes.com/elm-flatris.html"
      "https://github.com/w0rm/elm-flatris"
  , example
      "sketch-n-sketch"
      "http://ravichugh.github.io/sketch-n-sketch/releases/v0.5/"
      "https://github.com/ravichugh/sketch-n-sketch"
  ]


example : String -> String -> String -> List (Html msg)
example imgSrc demo code =
  [ a [ href demo, style ["display" => "block"] ]
      [ img
          [ src ("/assets/examples/" ++ imgSrc ++ ".png")
          , alt imgSrc
          , style [("width", "100%")]
          ]
          []
      ]
  , p [style ["display" => "block", "text-align" => "center", "margin" => "0", "height" => "60px" ]]
      [ a [href code] [text "source"]
      ]
  ]



-- FLUID LIST


fluidList : Int -> Int -> List (List (Html msg)) -> Html msg
fluidList itemWidth maxColumns itemList =
  let
    toPx : Int -> String
    toPx num =
      toString num ++ "px"

    bulletStyle =
        [ "display" => "inline-block"
        , "max-width" => toPx itemWidth
        , "vertical-align" => "top"
        , "text-align" => "left"
        , "margin" => ("0 " ++ toPx gutter)
        ]

    gutter = 30
  in
    section
      [style ["max-width" => toPx (itemWidth*maxColumns + 2*gutter*maxColumns), "margin" => "auto", "text-align" => "center"]]
      (List.map (section [style bulletStyle]) itemList)



-- USERS


userSection : Html msg
userSection =
  section [class "home-section"]
    [ h1 [] [text "Elm을 사용하는 분들"]
    , div [ class "featured-user" ]
        [ div [ class "quote" ]
            [ p [] [ text "한번도 런타임 중 실패를 겪은 적이 없고, 파일 크기는 우스울정도로 작으며, 우리의 코드 베이스에서 다른 어떤 것보다도 빠르게 실행됩니다. 게다가 버그도 적어졌죠..." ]
            , p [] [ text "요약하자면, 모든 새로운 코드를 Elm으로 작성하였습니다." ]
            ]
        , div [ class "attribution" ]
            [ div [ class "attribution-author" ]
                [ p [] [ text "Jeff Schomay" ]
                , p [] [ a [ href "https://www.pivotaltracker.com/blog/Elm-pivotal-tracker/" ] [ text "Pivotal Tracker Blog" ] ]
                ]
            , a [ class "attribution-logo"
                , href "https://www.pivotaltracker.com"
                ]
                [ div
                    [ style
                        [ "width" => "200px"
                        , "height" => "100px"
                        , "background-image" => ("url('" ++ toLogoSrc "PivotalTracker" "svg" ++ "')")
                        , "background-repeat" => "no-repeat"
                        , "background-position" => "center"
                        , "display" => "block"
                        ]
                    ]
                    []
                ]
            ]
        ]
    , fluidList 200 3
        [ company
            "NoRedInk"
            "http://tech.noredink.com/post/129641182738/building-a-live-validated-signup-form-in-elm"
            "png"
        , company
            "CircuitHub"
            "https://circuithub.com/"
            "png"
        , company
            "Carfax"
            "https://www.carfax.com/"
            "png"
        , company
            "Futurice"
            "http://futurice.com/blog/elm-in-the-real-world"
            "svg"
        , company
            "Gizra"
            "http://www.gizra.com/content/thinking-choosing-elm/"
            "png"
        , company
            "Prezi"
            "https://prezi.com/"
            "png"
        , company
            "TruQu"
            "https://truqu.com/"
            "png"
        , company
            "CircuitHub"
            "https://circuithub.com/"
            "png"
        , company
            "Beautiful Destinations"
            "http://www.beautifuldestinations.com/"
            "svg"
        , company
            "Hearken"
            "https://www.wearehearken.com/"
            "png"
        ]
    ]


company : String -> String -> String -> List (Html msg)
company name website extension =
  [ toLogo name website extension ]


toLogo : String -> String -> String -> Html msg
toLogo name website extension =
  let
    imgSrc =
      toLogoSrc name extension
  in
    a [ href website ]
      [ div
          [ style
              [ "width" => "200px"
              , "height" => "100px"
              , "background-image" => ("url('" ++ imgSrc ++ "')")
              , "background-repeat" => "no-repeat"
              , "background-position" => "center"
              ]
          ]
          []
      ]


toLogoSrc : String -> String -> String
toLogoSrc name extension =
  let
    lowerName =
      String.toLower name
  in
    "/assets/logos/"
    ++ String.map (\c -> if c == ' ' then '-' else c) lowerName
    ++ "." ++ extension
