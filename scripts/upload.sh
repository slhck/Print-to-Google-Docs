#!/bin/sh
#
# Uploads a local document, using Google Docs.
#
# Requires googlecl. Written for Mac OS X.
#
# Original idea by: dan@dans.im
# Modified by: Werner Robitza

DOCUMENT=$1

# Get document name and strip commas
DOCUMENT_NAME=$(basename "${1//,/ }")

# Strip the file extension from the end
DOCUMENT_NAME=${DOCUMENT_NAME%.*}

# Upload document - it doesn't exist
UPLOAD_RESULT=$(/usr/local/bin/google docs upload "$DOCUMENT" 2>&1 |grep 'Upload success')

# Open the newly uploaded document
URL=${UPLOAD_RESULT##*Direct link: }
open $URL
