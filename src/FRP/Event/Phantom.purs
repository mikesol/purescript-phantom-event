module FRP.Event.Phantom (PhantomEvent, unsafePhantom, proof0, Proof0, toEvent) where

import Prelude

import Control.Alternative (class Alt, class Alternative, class Plus)
import Data.Compactable (class Compactable)
import FRP.Event (class Filterable, class IsEvent)

data Proof0

newtype PhantomEvent :: forall k. (Type -> Type) -> k -> Type -> Type
newtype PhantomEvent event phantom a = PhantomEvent (event a)

unsafePhantom :: forall event proof a. event a -> PhantomEvent event proof a
unsafePhantom = PhantomEvent

proof0 :: forall event a. event a -> PhantomEvent event Proof0 a
proof0 = PhantomEvent

toEvent :: forall event proof a. PhantomEvent event proof a -> event a
toEvent (PhantomEvent e) = e

derive newtype instance Functor event => Functor (PhantomEvent event phantom)
derive newtype instance Apply event => Apply (PhantomEvent event phantom)
derive newtype instance Applicative event => Applicative (PhantomEvent event phantom)
derive newtype instance IsEvent event => IsEvent (PhantomEvent event phantom)
derive newtype instance Filterable event => Filterable (PhantomEvent event phantom)
derive newtype instance Compactable event => Compactable (PhantomEvent event phantom)
derive newtype instance Alternative event => Alternative (PhantomEvent event phantom)
derive newtype instance Plus event => Plus (PhantomEvent event phantom)
derive newtype instance Alt event => Alt (PhantomEvent event phantom)
derive newtype instance Semigroup (event a) => Semigroup (PhantomEvent event phantom a)
derive newtype instance Monoid (event a) => Monoid (PhantomEvent event phantom a)
