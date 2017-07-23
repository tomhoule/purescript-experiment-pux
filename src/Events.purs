module Events where

import Pux.DOM.Events (DOMEvent)

import Editions.Events as E

data Route = Home | EditionNew | NotFound

data Event =
  EditionForm E.EditionFormEvent
  | PageView Route
  | Navigate String DOMEvent
