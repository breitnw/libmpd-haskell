{-# LANGUAGE OverloadedStrings #-}

{- |
Module      : Network.MPD.Applicative.Connection
Copyright   : (c) Joachim Fasting 2012
License     : MIT

Maintainer  : joachifm@fastmail.fm
Stability   : stable
Portability : unportable

Connection settings.
-}

module Network.MPD.Applicative.Connection
    ( password
    , ping
    , binaryLimit
    ) where

import           Network.MPD.Applicative.Internal
import           Network.MPD.Core
import           Network.MPD.Commands.Arg hiding (Command)

-- | Authenticate session. The password is sent in plain text.
password :: Password -> Command ()
password pwd = Command emptyResponse ["password " ++ pwd]

-- | Ping daemon.
ping :: Command ()
ping = Command emptyResponse ["ping"]

-- | Set the maximum binary response size (in bytes) for the current connection.
binaryLimit :: Integer -> Command ()
binaryLimit limit = Command emptyResponse ["binarylimit" <@> limit]
