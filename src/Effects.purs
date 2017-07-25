module Effects where

import Control.Monad.Eff.Console (CONSOLE, log)
import DOM (DOM)
import DOM.HTML.Types (HISTORY)

type AppEffects = (console :: CONSOLE, history :: HISTORY, dom :: DOM)
