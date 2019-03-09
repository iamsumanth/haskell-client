{-# LANGUAGE OverloadedStrings #-}

module Handler.LDClient (getAllFlags) where

import Network.Wreq
import Control.Lens
import Data.Aeson (toJSON, decode)
import Data.ByteString.Lazy.Char8 as C

import Domain.FeatureFlags

authorizationKey = ""

getAllFlags :: IO (Maybe FeatureFlags)
getAllFlags = do
  allFlags <- getFlagsResponse
  let featureFlags = decode allFlags :: Maybe FeatureFlags
  return featureFlags

getFlagsResponse :: IO C.ByteString
getFlagsResponse = do
    let opts = defaults & header "Authorization" .~ [authorizationKey]
    resp <- getWith opts "https://app.launchdarkly.com/sdk/latest-all"
    return (resp ^. responseBody)
    
