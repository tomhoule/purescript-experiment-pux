module Models where

import Data.Generic (
class Generic
)
import Data.Maybe (
Maybe
)

data Schema = Schema (Array Node)

derive instance genericSchema :: Generic Schema

data Node = AnonymousFragment NumberedFragment | Aliter | Appendix | Axioma NumberedFragment | Caput NumberedFragment | Corollarium NumberedFragment | Definitio NumberedFragment | Demonstratio | Explicatio | Scope ScopeDescriptor | Lemma NumberedFragment | Pars NumberedFragment | Postulatum NumberedFragment | Praefatio | Propositio NumberedFragment | Scholium NumberedFragment

derive instance genericNode :: Generic Node

data NumberedFragment = NumberedFragment { num :: Maybe Int, children :: Array Node }

derive instance genericNumberedFragment :: Generic NumberedFragment

data ScopeDescriptor = ScopeDescriptor { title :: String, children :: Array Node }

derive instance genericScopeDescriptor :: Generic ScopeDescriptor

data Edition = Edition { id :: String, title :: String, editor :: String, year :: Int, language_code :: String, created_at :: String, updated_at :: String }

derive instance genericEdition :: Generic Edition

data EditionNew = EditionNew { title :: String, editor :: String, year :: Int, language_code :: String }

derive instance genericEditionNew :: Generic EditionNew

