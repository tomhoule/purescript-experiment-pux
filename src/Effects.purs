module Effects where

import Control.Monad.Eff.Console (CONSOLE)
import DOM (DOM)
import DOM.HTML.Types (HISTORY)
import Network.HTTP.Affjax (AJAX)

type AppEffects = (console :: CONSOLE, history :: HISTORY, dom :: DOM, ajax :: AJAX)
