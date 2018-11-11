module SocketApp exposing (Model, Msg(..), init, socketUrl, subscriptions, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Styles exposing (..)
import WebSocket



--Model--


type alias Model =
    { input : String
    , messages : List String
    }


init : ( Model, Cmd Msg )
init =
    ( Model "" [], Cmd.none )



-- Empty string and empty list for messages


socketUrl : String
socketUrl =
    "ws://localhost:5002"


type Msg
    = Input String
    | SendToSocket
    | SendMessage
    | MessageReceived String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Input str ->
            ( { model | input = str }, Cmd.none )

        SendToSocket ->
            ( model, WebSocket.send socketUrl model.input )

        MessageReceived str ->
            ( { model | messages = str :: model.messages }, Cmd.none )

        SendMessage ->
            update SendToSocket { model | messages = model.input :: model.messages }



--SUBSCRIPTIONS --


subscriptions : Model -> Sub Msg
subscriptions model =
    WebSocket.listen socketUrl MessageReceived



-- VIEW --


mainStyle : Attribute msg
mainStyle =
    style
        [ ( "backgroundColor", "#02f9f0" )
        , ( "width", "100%" )
        , ( "height", "100%" )
        , ( "display", "flex" )
        , ( "justifyContent", "center" )
        , ( "alignItems", "center" )
        , ( "boxSizing", "borderBox" )
        , ( "position", "relative" )
        ]


myStyle : Attribute msg
myStyle =
    style
        [ ( "margin", "auto" )
        , ( "background", "#f9fcfc" )
        , ( "textAlign", "center" )
        , ( "marginTop", "60px" )
        , ( "width", "40%" )
        , ( "height", "560px" )
        , ( "borderRadius", "5px" )
        , ( "position", "relative" )
        ]


textStyle : Attribute msg
textStyle =
    style
        [ ( "position", "absolute" )
        , ( "bottom", "23px" )
        , ( "width", "90%" )
        , ( "margin", "auto" )
        , ( "right", "25px" )
        ]


messageStyle : Attribute msg
messageStyle =
    style
        [ ( "width", "82%" )
        , ( "height", "80%" )
        , ( "margin", "auto" )
        , ( "marginTop", "20px" )
        , ( "borderRadius", "30px" )
        , ( "borderBottom", "1px solid #02f9f0" )
        , ( "overflowY", "auto" )
        ]


parStyle : Attribute msg
parStyle =
    style
        [ ( "fontSize", "34px" )
        , ( "color", "#ffffff" )
        , ( "position", "absolute" )
        , ( "top", "-20px" )
        ]


ulStyle : Attribute msg
ulStyle =
    style
        [ ( "listStyleType", "none" )
        , ( " margin", "0" )
        , ( "padding", "0" )
        , ( "width", "50%" )
        , ( "float", "right" )
        , ( "paddingLeft", "15px" )
        , ( "paddingTop", "10px" )
        , ( "alignItems", "left" )
        , ( "margin", "auto" )
        ]


liStyle : Attribute msg
liStyle =
    style
        [ ( "width", "80%" )
        , ( "background", "#3fff49" )
        , ( "borderRadius", "30px" )
        , ( "padding", "15px" )
        , ( "marginBottom", "10px" )
        , ( "color", "#fff" )
        , ( "fontSize", "18px" )
        ]


inputStyle : Attribute msg
inputStyle =
    style
        [ ( "paddingLeft", "15px" )
        , ( "paddingRight", "10px" )
        , ( "paddingBottom", "15px" )
        , ( "paddingTop", "13px" )
        , ( "width", "270px" )
        , ( "height", "22px" )
        , ( "background", "#bdd5f9" )
        , ( "border", "none" )
        , ( "borderRadius", "20px" )
        ]


btnStyle : Attribute msg
btnStyle =
    style
        [ ( "paddingLeft", "27px" )
        , ( "paddingRight", "27px" )
        , ( "paddingTop", "10px" )
        , ( "paddingBottom", "10px" )
        , ( "background", "#ef1a3d" )
        , ( "border", "none" )
        , ( "cursor", "pointer" )
        , ( "marginLeft", "20px" )
        , ( "color", "#ffffff" )
        ]


view : Model -> Html Msg
view model =
    div [ mainStyle ]
        [ p [ parStyle ]
            [ text "Chat Box with Elm" ]
        , div
            [ myStyle ]
            [ div [ messageStyle ]
                [ ul [ ulStyle ] (List.reverse (List.map (\i -> li [ liStyle ] [ text i ]) model.messages))
                , div [ textStyle ]
                    [ input
                        [ inputStyle
                        , onInput Input
                        ]
                        []
                    , button
                        [ btnStyle
                        , onClick SendMessage
                        ]
                        [ text "Send" ]
                    ]
                ]
            ]
        ]


main =
    program
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }
