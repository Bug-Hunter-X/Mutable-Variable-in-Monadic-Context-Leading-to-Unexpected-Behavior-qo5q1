```haskell
import Control.Monad.IO.Class (liftIO)
import Control.Concurrent.MVar (newMVar, readMVar, putMVar)

-- Pure function to calculate tax. Referentially transparent
calculateTax :: Double -> Double -> Double
calculateTax price taxRate = price * taxRate

main :: IO ()
main = do
  taxRateVar <- newMVar 0.15 -- Initialize tax rate
  let price = 100.0
  taxRate <- liftIO $ readMVar taxRateVar -- Read tax rate
  let tax = calculateTax price taxRate
  liftIO $ putStrLn ("Tax: " ++ show tax)
  -- Modify tax rate (purely)
  let newTaxRate = 0.20
  liftIO $ putMVar taxRateVar newTaxRate
```