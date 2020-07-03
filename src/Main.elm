module Main exposing (main)

import Browser
import Element exposing (Element, Option)
import Element.Background as Background
import Element.Border as Border
import Element.Events as Events
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { button1 : Click
    , text : String
    }


type Click
    = Up
    | Down


init : Model
init =
    { button1 = Up
    , text = ""
    }


type Msg
    = Button1MouseDown
    | Button1MouseUp
    | InputChange String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Button1MouseDown ->
            { model | button1 = Down }

        Button1MouseUp ->
            { model | button1 = Up }

        InputChange text ->
            { model | text = text }


view : Model -> Html Msg
view model =
    Element.layoutWith { options = [ option ] }
        [ Background.color <| Element.rgba255 239 238 238 1 ]
    <|
        viewNeumorphism model


option : Option
option =
    Element.focusStyle
        { borderColor = Nothing
        , backgroundColor = Nothing
        , shadow = Nothing
        }


viewNeumorphism : Model -> Element Msg
viewNeumorphism model =
    Element.column
        [ Element.centerX
        , Element.centerY
        , Element.spacing 50
        ]
        [ viewCard model.text
        , viewButton model.button1
        , viewInput model.text
        , viewCircle
        ]


viewCard : String -> Element Msg
viewCard text =
    Element.el
        [ Element.width <| Element.px 400
        , Element.height <| Element.px 300
        , Element.centerX
        , Element.centerY
        , Element.behindContent viewCard2
        , Background.color <| Element.rgba255 239 238 238 1
        , Border.rounded 25
        , Border.shadow
            { offset = ( 8, 8 )
            , size = 0
            , blur = 16
            , color = Element.rgba255 209 205 199 0.5
            }
        ]
    <|
        viewInput text


viewCard2 : Element Msg
viewCard2 =
    Element.el
        [ Element.width Element.fill
        , Element.height Element.fill
        , Border.rounded 25
        , Border.shadow
            { offset = ( -8, -8 )
            , size = 0
            , blur = 16
            , color = Element.rgba255 255 255 255 0.5
            }
        ]
        Element.none


viewButton : Click -> Element Msg
viewButton click =
    case click of
        Up ->
            Input.button
                [ Element.width <| Element.px 120
                , Element.height <| Element.px 40
                , Element.centerX
                , Element.centerY
                , Element.behindContent <| viewButton2 Up
                , Border.rounded 25
                , Border.shadow
                    { offset = ( 8, 8 )
                    , size = 0
                    , blur = 16
                    , color = Element.rgba255 209 205 199 0.5
                    }
                , Events.onMouseDown Button1MouseDown
                ]
                { onPress = Nothing
                , label =
                    Element.el
                        [ Element.centerX
                        , Element.centerY
                        , Font.color <| Element.rgba255 159 155 149 1
                        ]
                    <|
                        Element.text "Click Me"
                }

        Down ->
            Input.button
                [ Element.width <| Element.px 120
                , Element.height <| Element.px 40
                , Element.centerX
                , Element.centerY
                , Element.behindContent <| viewButton2 Down
                , Border.rounded 25
                , Border.innerShadow
                    { offset = ( -8, -8 )
                    , size = 0
                    , blur = 16
                    , color = Element.rgba255 255 255 255 0.5
                    }
                , Events.onMouseUp Button1MouseUp
                ]
                { onPress = Nothing
                , label =
                    Element.el
                        [ Element.centerX
                        , Element.centerY
                        , Font.color <| Element.rgba255 109 105 99 1
                        ]
                    <|
                        Element.text "Click Me"
                }


viewButton2 : Click -> Element Msg
viewButton2 click =
    case click of
        Up ->
            Element.el
                [ Element.width Element.fill
                , Element.height Element.fill
                , Background.color <| Element.rgba255 239 238 238 1
                , Border.rounded 25
                , Border.shadow
                    { offset = ( -8, -8 )
                    , size = 0
                    , blur = 16
                    , color = Element.rgba255 255 255 255 0.5
                    }
                ]
                Element.none

        Down ->
            Element.el
                [ Element.width Element.fill
                , Element.height Element.fill
                , Background.color <| Element.rgba255 239 238 238 1
                , Border.rounded 25
                , Border.innerShadow
                    { offset = ( 8, 8 )
                    , size = 0
                    , blur = 16
                    , color = Element.rgba255 209 205 199 0.5
                    }
                ]
                Element.none


viewInput : String -> Element Msg
viewInput text =
    Input.text
        [ Element.width <| Element.px 300
        , Element.height <| Element.px 40
        , Element.centerX
        , Element.centerY
        , Element.behindContent viewInput2
        , Background.color <| Element.rgba255 239 238 238 0
        , Border.width 0
        , Border.rounded 25
        , Border.innerShadow
            { offset = ( -8, -8 )
            , size = 0
            , blur = 16
            , color = Element.rgba255 255 255 255 0.5
            }
        , Font.color <| Element.rgba255 109 105 99 1
        ]
        { onChange = InputChange
        , text = text
        , placeholder = Nothing
        , label = Input.labelHidden "Test Me"
        }


viewInput2 : Element Msg
viewInput2 =
    Element.el
        [ Element.width Element.fill
        , Element.height Element.fill
        , Background.color <| Element.rgba255 239 238 238 1
        , Border.rounded 25
        , Border.innerShadow
            { offset = ( 8, 8 )
            , size = 0
            , blur = 16
            , color = Element.rgba255 209 205 199 0.5
            }
        ]
        Element.none


viewCircle : Element Msg
viewCircle =
    Element.el
        [ Element.width <| Element.px 50
        , Element.height <| Element.px 50
        , Element.centerX
        , Element.centerY
        , Element.behindContent viewCircle2
        , Border.rounded 25
        , Border.shadow
            { offset = ( 8, 8 )
            , size = 0
            , blur = 16
            , color = Element.rgba255 209 205 199 0.5
            }
        , Font.color <| Element.rgba255 109 105 99 1
        , Font.bold
        ]
    <|
        Element.el [ Element.centerX, Element.centerY ] <|
            Element.text "H"


viewCircle2 : Element Msg
viewCircle2 =
    Element.el
        [ Element.width Element.fill
        , Element.height Element.fill
        , Background.color <| Element.rgba255 239 238 238 1
        , Border.rounded 25
        , Border.shadow
            { offset = ( -8, -8 )
            , size = 0
            , blur = 16
            , color = Element.rgba255 255 255 255 0.5
            }
        ]
        Element.none
