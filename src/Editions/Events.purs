module Editions.Events where

import Editions.New

data EditionFormEvent = Edit (EditionFormState -> EditionFormState) | Index
