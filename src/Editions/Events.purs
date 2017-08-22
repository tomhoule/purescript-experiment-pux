module Editions.Events where

import Models (EditionNew)

data EditionFormEvent = Edit (EditionNew -> EditionNew) | Index
