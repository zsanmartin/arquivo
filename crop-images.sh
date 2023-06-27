for PHOTO_FILEPATH in $(find images -name "*.jpeg"); do
  for THUMB_DIR in thumbs largeThumbs; do
    PHOTO_DIR=${PHOTO_FILEPATH%/*g}
    mkdir -p "$THUMB_DIR/$PHOTO_DIR"
    $DESTINATION_FILE="$THUMB_DIR/$PHOTO_FILEPATH"
    if [ ! -f "$DESTINATION_FILE" ]; then
      convert -resize 320x320^ -gravity center -extent 300x300 $PHOTO_FILEPATH
    fi
  done
done

