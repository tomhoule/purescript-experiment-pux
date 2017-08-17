module Events where

import Pux.DOM.Events (DOMEvent)
import Models (Schema)

import Editions.Events as E

data Route =
  Home
  | EditionNew
  | NotFound
  | Pars1

data Event =
  EditionForm E.EditionFormEvent
  | Initialize
  | ReceiveSchema Schema
  | PageView Route
  | Navigate String DOMEvent
