{-# LANGUAGE FlexibleInstances #-}
module Model where

import ClassyPrelude.Yesod
import Database.Persist.Quasi

-- You can define all of your database entities in the entities file.
-- You can find more information on persistent and how to declare entities
-- at:
-- http://www.yesodweb.com/book/persistent/
share [mkPersist sqlSettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models")

-- { "id": 1, "status": false, "title": "shopping" }
instance ToJSON (Entity Todo) where
  toJSON (Entity tid t) = object
    [ "id"     .= (String $ toPathPiece tid)
    , "status" .= todoStatus t
    , "title"  .= todoTitle t
    ]

instance FromJSON Todo where
  parseJSON (Object o) = Todo
    <$> o .: "status"
    <*> o .: "title"

  parseJSON _          = mzero
