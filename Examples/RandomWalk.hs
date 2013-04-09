{-# LANGUAGE TypeFamilies #-}
module RL.Examples.RandomWalk where

import RL.Frontend
import GHC.Enum
  
data RWGame = ZeroExit | A | B | C | D | E | OneExit
              deriving (Eq, Show, Enum, Ord)
  
instance Game RWGame where
  data GameAction RWGame = Only
  
  stateTrans _ s = [(pred s, 0.5), (succ s, 0.5)]
  
  reward _ OneExit = 1
  reward _ _ = 0
  
  terminal ZeroExit = True
  terminal OneExit = True
  terminal _ = False