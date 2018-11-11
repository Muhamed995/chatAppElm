module Main exposing (Model, Msg(..), getSubmitMessage, init, isSubmitDisabled, main, model, retrieveData, subscriptions, update, view)

import Css exposing (..)
import Html.Styled exposing (Html, button, div, input, program, text, ul)
import Html.Styled.Attributes exposing (css, href, placeholder, src, type_, value)
import Html.Styled.Events exposing (onClick, onInput)
import Process
import Styles exposing (..)
import Task
import Time


type Msg
    = Username String
    | Porta String
    | Submit
    | FetchComplete Time.Time


type alias Model =
    { userName : String
    , porta : String
    , isSubmitting : Bool
    }


isSubmitDisabled : Model -> List Style
isSubmitDisabled model =
    if model.userName == "" then
        submitDisabledStyle

    else if model.isSubmitting == True then
        submitDisabledStyle

    else
        submitStyle


retrieveData : Cmd Msg
retrieveData =
    Task.perform FetchComplete (Process.sleep 2000 |> Task.andThen (\_ -> Time.now))


getSubmitMessage : Model -> String
getSubmitMessage model =
    if model.isSubmitting == True then
        "Submitting.."

    else
        "Submit"


model : Model
model =
    Model "" "" False


init : ( Model, Cmd Msg )
init =
    ( { userName = ""
      , porta = ""
      , isSubmitting = False
      }
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Username userNameText ->
            ( { model | userName = userNameText }, Cmd.none )

        Porta nameText ->
            ( { model | porta = nameText }, Cmd.none )

        Submit ->
            ( { model | isSubmitting = True }, retrieveData )

        FetchComplete _ ->
            ( { model | isSubmitting = False }, Cmd.none )


view : Model -> Html Msg
view model =
    div [ css rootStyle ]
        [ div [ css formStyle ]
            [ input
                [ css inputStyle
                , type_ "text"
                , placeholder "Name"
                , value model.userName
                , onInput Username
                ]
                []
            , input
                [ css inputStyle
                , type_ "text"
                , placeholder "Port"
                , value model.porta
                , onInput Porta
                ]
                []
            , button
                [ css (isSubmitDisabled model)
                , onClick Submit
                ]
                [ text (getSubmitMessage model)
                ]
            ]
        ]


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
