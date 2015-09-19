module Handler.Todo where

import Import

getTodosR :: Handler Value
-- getTodoR = error "Not yet implemented: getTodoR"
-- getTodosR = defaultLayout $(widgetFile "todo")
getTodosR = error "index"

postTodosR :: Handler ()
postTodosR = error "create"

getTodoR :: Int -> Handler Value
getTodoR = error "show"

putTodoR :: Int -> Handler Value
putTodoR = error "update"

deleteTodoR :: Int -> Handler Value
deleteTodoR = error "delete"
