module Handler.Todo where

import Import

getTodoR :: Handler Html
-- getTodoR = error "Not yet implemented: getTodoR"
getTodoR = defaultLayout $(widgetFile "todo")
