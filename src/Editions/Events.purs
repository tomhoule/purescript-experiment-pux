module Editions.Events where

import Models (EditionNew, Edition)

data EditionFormEvent =
  Edit (EditionNew -> EditionNew)
  | Index
  | ReceiveEdition Edition
  | Submit EditionNew
