{-# LANGUAGE OverloadedStrings #-}

module Handler.LDClient (getAllFlags) where

import Network.Wreq

import Control.Lens

import Data.Aeson (toJSON)

import Data.ByteString.Lazy.Char8 as C

getAllFlags :: IO String
getAllFlags = do
  r <- get "http://httpbin.org/get"
  return (C.unpack $ (r ^. responseBody))
