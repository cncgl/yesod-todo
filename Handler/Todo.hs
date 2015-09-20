module Handler.Todo where

import Import

-- Index
getTodosR :: Handler Value
-- getTodosR = error "index"
getTodosR = do
  todos <- runDB $ selectList [] [] :: Handler [Entity Todo]
  return $ object ["todos" .= todos]

-- Create
postTodosR :: Handler ()
postTodosR = error "create"

-- Show
getTodoR :: Int -> Handler Value
getTodoR = error "show"

-- Update
putTodoR :: Int -> Handler Value
putTodoR = error "update"

patchTodoR :: Int -> Handler Value
patchTodoR = error "update"

-- Delete
deleteTodoR :: Int -> Handler Value
deleteTodoR = error "delete"
