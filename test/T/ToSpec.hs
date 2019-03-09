import Test.Hspec

import qualified T.ToSpec

main :: IO ()
main = hspec spec

spec :: Spec
spec = describe "T.To" T.ToSpec.spec
