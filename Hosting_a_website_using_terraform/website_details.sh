#!/bin/bash

sudo apt update  
sudo apt-get install apache2 zip wget -y

# start the apache2 and enable it.
sudo systemctl start apache2
sudo systemctl enable apache2

# moveing to /tmp/localfile directory.
mkdir -r /tmp/localfile

# Define the URL
TEMPLATE_URL="https://www.tooplate.com/zip-templates/2132_clean_work.zip"

# Define the destination directory
DESTINATION_DIR="/tmp/localfile"
APACHE2_DIR="/var/www/html"

# Use basename to extract the file name
FILE_NAME=$(basename "$TEMPLATE_URL" .zip)

# Download the zip file
echo "Downloading $FILE_NAME..."
curl -k -o "$FILE_NAME" "$TEMPLATE_URL"

# Check if the download was successful
if [ $? -eq 0 ]; then
    # Unzip the file
    echo "Unzipping $FILE_NAME..."
    unzip "$FILE_NAME" -d "$DESTINATION_DIR"

    # Move the contents to the desired directory
    echo "Moving files to $APACHE2_DIR..."
    sudo mv "$DESTINATION_DIR/$FILE_NAME"/* "$APACHE2_DIR"

    echo "Files extracted and moved successfully to $APACHE2_DIR."
else
    echo "Failed to download $FILE_NAME. Please check the URL and try again."
fi

# Clean up the downloaded zip file
rm -rf "$FILE_NAME"