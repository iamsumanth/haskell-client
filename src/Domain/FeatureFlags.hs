{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
module Domain.FeatureFlags(FeatureFlags) where

import Data.Aeson
import Data.Map as Map

import Domain.Feature

type FeaturesMap = Map FeatureName Feature

data FeatureFlags = FeatureFlags
  { flags :: FeaturesMap } deriving Show


instance FromJSON FeatureFlags where
  parseJSON (Object o) = FeatureFlags
      <$> (o .: "flags")

instance ToJSON FeatureFlags where
  toJSON FeatureFlags {..} = object
    [ "flags" .= flags ]

