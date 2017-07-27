module Api where

import Control.Monad.Aff (Aff)
import Data.Either (Either)
import Models.Edition (Edition)
import Network.HTTP.Affjax (get, AJAX)
import Prelude (bind, ($), pure)
import Data.Argonaut.Decode.Generic (gDecodeJson)

editions :: forall eff. Aff (ajax :: AJAX | eff) (Either String Edition)
editions = do
  res <- get "/api/v1/editions"
  pure $ gDecodeJson res.response
