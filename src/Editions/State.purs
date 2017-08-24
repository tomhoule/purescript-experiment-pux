module Editions.State where

import Data.Maybe (Maybe)
import Models (Edition, EditionNew(..))

type EditionsState =
  { form :: EditionNew
  , index :: Maybe (Array Edition)
  , single :: Maybe Edition
  }

