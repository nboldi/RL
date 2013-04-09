{-# LANGUAGE TypeFamilies #-}
module RL.Class where

-- | The representation of the generic RL problem. The class is instantialized with the game representation.
class Game g where  
  -- | Type of game actions (chosen by the player).
  data GameAction g 
  
  -- | Stochastic state transition from a given state and chosen action.
  -- If no more move is avalible, the move is not valid.
  stateTrans :: GameAction g -> g -> [(g, Probability)]
  
  -- | When reaching a terminal state, the game is considered finished.
  terminal :: g -> Bool
  
  -- | The immediate reward after choosing the given action in the given state.
  -- The reward must be given even after the game finished.
  reward :: (Num r) => GameAction g -> g -> r
  
type Probability = Rational
type Strategy g = GameAction g -> g -> [(GameAction g, Probability)]
