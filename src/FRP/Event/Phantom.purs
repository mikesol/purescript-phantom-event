module FRP.Event.Phantom (PhantomEvent, unsafePhantom, proof0, Proof0, toEvent) where

import Prelude

import Control.Alternative (class Alt, class Alternative, class Plus)
import Data.Compactable (class Compactable)
import FRP.Event (class Filterable, class IsEvent, Event)

data Proof0

newtype PhantomEvent :: forall k. k -> Type -> Type
newtype PhantomEvent phantom a = PhantomEvent (Event a)

unsafePhantom :: forall proof a. Event a -> PhantomEvent proof a
unsafePhantom = PhantomEvent

proof0 :: forall a. Event a -> PhantomEvent Proof0 a
proof0 = PhantomEvent

toEvent :: forall proof a. PhantomEvent proof a -> Event a
toEvent (PhantomEvent e) = e

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
