import Graphics.Element (..)

-- fittedImage crops and resizes the image to fill the given area without
-- becoming deformed.

main : Element
main =
  fittedImage 300 300 "/book.jpg"