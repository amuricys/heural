module Logic.Maths where

sigmoid :: Float -> Float
sigmoid x = 1 / (1 + exp (-x))

-- (d/dx) sig(x) = sig(x)(1 - sig(x)) :shrug:
sigmoid' :: Float -> Float
sigmoid' x =
  let s   = sigmoid x in
      s * (1 - s)

-- This is an implementation of the Box-Muller transform i think. I dunno if this plus
-- the impure part is actually what makes it up :shrug: 
boxMuller :: Float -> Float -> Float
boxMuller x1 x2 = sqrt (-2 * log x1) * cos (2 * pi * x2)

-- This will be squared after which makes sqrt pointless, but it is what it is :actualshrug:
vectorLength :: Floating a => [a] -> a
vectorLength = sqrt . sum . map (^2)

-- Activations here refer to the output of the brain
quadratic :: [Float] -> [Float] -> Float
quadratic activations ys = (^2) . vectorLength . zipWith (-) activations $ ys
