module Styles exposing (formStyle, inputStyle, rootStyle, submitStyle)

import Css exposing (..)


rootStyle : List Style
rootStyle =
    [ backgroundColor (hex "#282832")
    , width (pct 100)
    , height (vh 100)
    , displayFlex
    , justifyContent center
    , alignItems center
    , boxSizing borderBox
    ]


inputStyle : List Style
inputStyle =
    [ paddingLeft (px 15)
    , paddingTop (px 10)
    , paddingRight (px 10)
    , paddingBottom (px 10)
    , borderRadius (px 2)
    , borderStyle none
    , marginBottom (px 15)
    , display block
    , color (hex "#757575")
    , backgroundColor (hex "#ffffff")
    , width (pct 90)
    ]


formStyle : List Style
formStyle =
    [ backgroundColor (hex "#f9fbff")
    , width (pct 50)
    , maxWidth (pct 50)
    , height (px 560)
    , displayFlex
    , borderRadius (px 20)
    , justifyContent center
    , alignItems center
    ]


submitStyle : List Style
submitStyle =
    [ backgroundColor (hex "F22960")
    , paddingLeft (px 35)
    , paddingRight (px 35)
    , paddingTop (px 10)
    , paddingBottom (px 10)
    , borderStyle none
    , color (hex "#fff")
    , borderRadius (px 2)
    , marginTop (px 10)
    , cursor pointer
    ]
