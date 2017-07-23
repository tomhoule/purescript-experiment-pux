module Events where

import Pux.DOM.Events (onClick, onChange, DOMEvent, targetValue)

import Editions as E

data Event = EditionForm E.EditionFormEvent
