module RL.Frontend 
( module RL.Frontend
, Game(..)
) where

import RL.Class
import Data.List
import Control.Monad.Random

isValidMove :: Game g => GameAction g -> g -> Bool
isValidMove a = null . stateTrans a

evalProbs :: MonadRandom m => [(a, Probability)] -> m a
evalProbs = fromList
