module Editions.Events where

import Pux.DOM.Events (onClick, onChange, DOMEvent, targetValue)

data EditionFormEvent = Initialize | Edit DOMEvent
