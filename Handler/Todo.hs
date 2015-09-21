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
postTodosR = do
  todo <- requireJsonBody :: Handler Todo
  _    <- runDB $ insert todo

  sendResponseStatus status201 ("CREATED" :: Text )

-- Show
getTodoR :: TodoId -> Handler Value
getTodoR tid = do
  todo <- runDB $ get404 tid

  return $ object ["todo" .= (Entity tid todo)]

-- Update
putTodoR :: TodoId -> Handler Value
putTodoR = error "update"

patchTodoR :: TodoId -> Handler Value
patchTodoR = error "update"

-- Delete
deleteTodoR :: TodoId -> Handler Value
deleteTodoR = error "delete"
