{-# LANGUAGE CPP #-}
{-# LANGUAGE NoImplicitPrelude #-}
-- |
-- Module:       $HEADER$
-- Description:  Extended module Data.Function, from base, with additional
--               functions.
-- Copyright:    (c) 2015, Peter Trško
-- License:      BSD3
--
-- Maintainer:   peter.trsko@gmail.com
-- Stability:    experimental
-- Portability:  CPP, NoImplicitPrelude
--
-- Extended module "Data.Function", from base, with additional functions.
module Data.Function.Extended
    (
    -- * Re-export of Data.Function from base
      module Data.Function

    -- * Extra functions
    , ($$)
#if !MIN_VERSION_base(4,8,0)
    , (&)
#endif
    , (&$)
    )
  where

import Data.Function


-- | Flipped version of '$'.
($$) :: a -> (a -> b) -> b
x $$ f = f x
infixr 0 $$
{-# INLINE ($$) #-}

-- Function (&) is available in base since version 4.8.0.0. Haddock
-- comment taken from Data.Function module from base.
#if !MIN_VERSION_base(4,8,0)
-- | '&' is a reverse application operator. This provides notational
-- convenience. Its precedence is one higher than that of the forward
-- application operator '$', which allows '&' to be nested in '$'.
(&) :: a -> (a -> b) -> b
x & f = f x
infixl 1 &
{-# INLINE (&) #-}
#endif

-- | Variant of function '$', but with fixity as '&' function.
(&$) :: (a -> b) -> a -> b
f &$ a = f a
infixl 1 &$
{-# INLINE (&$) #-}
