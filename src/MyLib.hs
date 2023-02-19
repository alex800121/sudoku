module MyLib where

import Data.List ( transpose )
import Data.List.Split ( chunksOf )

type Fields a = [[a]]

rows :: Fields a -> Fields a
rows = id

columns :: Fields a -> Fields a
columns = transpose

boxes :: Fields a -> Fields a
boxes x = let
  f = [take 3, take 3 . drop 3, drop 6]
  in map concat $ chunksOf 3 $ concatMap ((f <*>) . ($ x)) f

