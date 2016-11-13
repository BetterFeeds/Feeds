#!/usr/bin/env bash

TMP=$(mktemp -d)

curl "http://feeds.feedburner.com/BsdNowMp3" | xmllint --format - > "$TMP/MP3"
curl "http://feeds.feedburner.com/BsdNowOgg" | xmllint --format - > "$TMP/OGG"
curl "http://feeds.feedburner.com/BsdNowMobile" | xmllint --format - > "$TMP/MP4-low"
curl "http://feeds.feedburner.com/BsdNowHd" | xmllint --format - > "$TMP/MP4-high"
curl "http://bitlove.org/jupiterbroadcasting/bsdnowhd/feed" | xmllint --format - > "$TMP/MP4-bt"

$EDITOR "$TMP/MP3" "$TMP/OGG" "$TMP/MP4-low" "$TMP/MP4-high" "$TMP/MP4-bt"

rm -rf "$TMP"
