for PHOTO_FILEPATH in $(find images -name "*.jpeg"); do
  PHOTO_DIR=${PHOTO_FILEPATH%/*g}
  mkdir -p "thumbs/$PHOTO_DIR"
  convert -resize 320x320^ -gravity center -extent 300x300 $PHOTO_FILEPATH "thumbs/$PHOTO_FILEPATH"
done

