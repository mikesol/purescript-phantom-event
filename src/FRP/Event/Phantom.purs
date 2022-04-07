module FRP.Event.Phantom where

import Prelude

import Control.Alternative (class Alt, class Alternative, class Plus)
import Data.Compactable (class Compactable)
import Data.Newtype (class Newtype)
import FRP.Event (class Filterable, class IsEvent, Event)

newtype PhantomEvent :: forall k. k -> Type -> Type
newtype PhantomEvent phantom a = PhantomEvent (Event a)

derive instance Newtype (PhantomEvent phantom a) _
derive newtype instance Functor (PhantomEvent phantom)
derive newtype instance Apply (PhantomEvent phantom)
derive newtype instance Applicative (PhantomEvent phantom)
derive newtype instance IsEvent (PhantomEvent phantom)
derive newtype instance Filterable (PhantomEvent phantom)
derive newtype instance Compactable (PhantomEvent phantom)
derive newtype instance Alternative (PhantomEvent phantom)
derive newtype instance Plus (PhantomEvent phantom)
derive newtype instance Alt (PhantomEvent phantom)
derive newtype instance Semigroup a => Semigroup (PhantomEvent phantom a)
derive newtype instance Monoid a => Monoid (PhantomEvent phantom a)
