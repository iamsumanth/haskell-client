{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
module Domain.Feature(Feature, FeatureName) where

import Data.Aeson

type FeatureName = String
type TargetServe = Bool
type Version = Int

data Feature = Feature
  { key       :: FeatureName
  , version   :: Version
  , on        :: TargetServe
  } deriving Show

instance FromJSON Feature where
  parseJSON (Object o) = Feature
      <$> (o .: "key")
      <*> (o .: "version")
      <*> (o .: "on")

instance ToJSON Feature where
  toJSON Feature {..} = object
    [ "key" .= key
    , "version" .= version
    , "on" .= on
    ]

