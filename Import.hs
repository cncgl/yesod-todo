module Import
    ( module Import
    ) where

import Foundation                 as Import
import Import.NoFoundation        as Import
import Language.Haskell.TH.Syntax (Exp (ConE))
import Yesod.Fay                  (FayFile)
import Network.HTTP.Types()

fayFile :: FayFile
fayFile = fayFile' (ConE 'StaticR)
