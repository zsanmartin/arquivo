for PHOTO_FILEPATH in $(find images/photos -name "*.jpeg"); do
  for THUMB_DIR in thumbs largeThumbs; do
    PHOTO_DIR=${PHOTO_FILEPATH%/*g}
    mkdir -p "$THUMB_DIR/$PHOTO_DIR"
    DESTINATION_FILE="$THUMB_DIR/$PHOTO_FILEPATH"
    if [ ! -f "$DESTINATION_FILE" ]; then
      echo $DESTINATION_FILE
      if [ $THUMB_DIR = "thumbs" ]; then
        convert -resize 320x320^ -gravity center -extent 300x300 $PHOTO_FILEPATH $DESTINATION_FILE
      else
        convert -resize 1000x700^ $PHOTO_FILEPATH $DESTINATION_FILE
      fi
    fi
  done
done
