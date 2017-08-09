module API where

import Data.Either (Either, either)
import Control.Monad.Aff (Aff)
import Control.Monad.Eff.Exception (error, Error)
import Control.Monad.Error.Class (class MonadThrow, throwError)
import Models (Edition, Schema)
import Network.HTTP.Affjax as A
import Prelude (bind, pure, (<<<))
import Data.Argonaut.Decode.Generic (gDecodeJson)
import Data.Generic (class Generic)

type HTTPMonad a = forall eff. Aff (ajax :: A.AJAX | eff) a

throwString :: forall m. MonadThrow Error m => String -> m Error
throwString = throwError <<< error

get :: forall a . Generic a => A.URL -> HTTPMonad a
get url = do
  res <- A.get url
  let payload = gDecodeJson res.response :: Either String a
  either (throwError <<< error) pure payload

editions :: HTTPMonad (Array Edition)
editions = get "/api/editions"

schema :: HTTPMonad Schema
schema = get "/api/ethica/schema"
