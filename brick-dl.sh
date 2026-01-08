#!/bin/bash

# Main script for downloading Brick Rigs mods.
# This script orchestrates the download process by utilizing modular functions.

# --- Sourcing Modules ---
# Import all necessary modules.
source "$(dirname "$0")/modules/config.sh"
source "$(dirname "$0")/modules/logging.sh"
source "$(dirname "$0")/modules/utils.sh"
source "$(dirname "$0")/modules/download.sh"
source "$(dirname "$0")/modules/file_ops.sh"

# --- Main Execution Logic ---

# Check if a mod ID was provided as a command-line argument.
if [ -z "$1" ]; then
    log_usage "$0"
    exit 1
fi

MOD_ID="$1"

# --- Step 1: Download the mod ---
# The download_mod function handles the steamcmd download and returns the path to the downloaded file.
# It also handles temporary directory cleanup within itself.
DOWNLOADED_FILE_PATH=$(download_mod "$MOD_ID")

# Check if the download was successful
if [ $? -ne 0 ]; then
    # Error message is already printed by download_mod function
    exit 1
fi

# --- Step 2: Prepare destination ---
# Generate a unique random name for the mod's directory.
RANDOM_NAME=$(generate_random_name)

# Prepare the final destination directory using the random name.
DEST_DIR_PATH=$(prepare_destination_dir "$TARGET_BASE" "$RANDOM_NAME")

# Check if destination directory preparation was successful.
if [ $? -ne 0 ]; then
    # Error message already printed by prepare_destination_dir
    exit 1
fi

# Define the final path for the Vehicle.brv file within the destination directory.
FINAL_VEHICLE_PATH="$DEST_DIR_PATH/Vehicle.brv"

# --- Step 3: Move and set permissions ---
# Move the downloaded Vehicle.brv file to the prepared destination.
if ! move_vehicle_file "$DOWNLOADED_FILE_PATH" "$FINAL_VEHICLE_PATH"; then
    # Error message already printed by move_vehicle_file
    exit 1
fi

# Set read, write, and execute permissions for all users on the mod directory.
if ! set_permissions "$DEST_DIR_PATH"; then
    # Error message already printed by set_permissions
    exit 1
fi

# --- Completion Message ---
log_success "Mod $MOD_ID successfully downloaded and installed."
log_success "It is saved in folder: $RANDOM_NAME"

exit 0