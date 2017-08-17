module API where

import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Console (log)
import Data.Either (Either, either)
import Control.Monad.Aff (Aff, liftEff')
import Control.Monad.Eff.Exception (error, Error)
import Control.Monad.Error.Class (class MonadThrow, throwError)
import Models (Edition, Schema)
import Network.HTTP.Affjax as A
import Network.HTTP.StatusCode
import Prelude (bind, pure, (<<<), discard, ($), (/=), const, (<>))
import Data.Argonaut.Generic.Aeson as AE
import Data.Generic (class Generic)
import Data.Argonaut.Core (Json)
import Control.MonadZero
import Signal.Channel
import State
import Config

decodeJSON :: forall a. Generic a => Json -> Either String a
decodeJSON = AE.decodeJson

data RequestOutcome a = Success a | NotFound | ServerError

type HTTPMonad a = forall eff. Aff (ajax :: A.AJAX, channel :: CHANNEL, console :: CONSOLE | eff) a

throwString :: forall m. MonadThrow Error m => String -> m Error
throwString = throwError <<< error

handleGetErrors :: forall a. A.AffjaxResponse a -> HTTPMonad a
handleGetErrors res = case res.status of
  StatusCode 200 -> pure res.response
  StatusCode 404 -> throwError $ error "Not Found xoxo"
  _ -> throwError $ error "Server Error xoxo"

get :: forall a . Generic a => A.URL -> State -> HTTPMonad a
get url { config: Config { apiURL } } = do
  res <- A.get (apiURL <> url)
  json <- handleGetErrors res
  payload <- pure $ decodeJSON json
  either (throwError <<< error) pure payload

editions :: State -> HTTPMonad (Array Edition)
editions = get "/api/editions"

schema :: State -> HTTPMonad Schema
schema = get "/api/ethica/schema"
