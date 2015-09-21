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
update :: TodoId -> Handler Value
update tid = do
  todo <- requireJsonBody :: Handler Todo
  runDB $ replace tid todo

  sendResponseStatus status200 ("UPDATED" :: Text)

putTodoR :: TodoId -> Handler Value
putTodoR tid = Handler.Todo.update tid

patchTodoR :: TodoId -> Handler Value
patchTodoR tid = Handler.Todo.update tid

-- Delete
deleteTodoR :: TodoId -> Handler Value
deleteTodoR tid = do
  runDB $ delete tid

  sendResponseStatus status200 ("DELETED" :: Text)
