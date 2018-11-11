module Styles exposing (formStyle, inputStyle, newStyle, rootStyle, submitDisabledStyle, submitStyle)

import Css exposing (..)



-- Styles --


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
    , backgroundColor (hex "#282832")
    , width (pct 90)
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


submitDisabledStyle : List Style
submitDisabledStyle =
    [ backgroundColor (hex "#282832")
    , paddingLeft (px 35)
    , paddingRight (px 35)
    , paddingTop (px 10)
    , paddingBottom (px 10)
    , borderStyle none
    , color (hex "#aaa")
    , borderRadius (px 2)
    , pointerEvents none
    , marginTop (px 10)
    , cursor pointer
    ]


formStyle : List Style
formStyle =
    [ padding (px 25)
    , backgroundColor (hex "#3F4049")
    , borderRadius (px 2)
    , width (px 250)
    , maxWidth (px 250)
    ]


newStyle : List Style
newStyle =
    [ width (pct 50)
    , height (px 560)
    ]


inputNewStyle : List Style
inputNewStyle =
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
    , width (pct 50)
    , margin auto
    ]
