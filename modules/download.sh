#!/bin/bash

# Module for handling the download of mods using steamcmd.

# Imports
source "$(dirname "$0")/config.sh"

# Downloads a specific mod using steamcmd.
# Arguments:
#   $1: The MOD_ID of the mod to download.
# Returns:
#   0 on success, prints the path to the downloaded file to stdout.
#   1 on failure.
# Side Effects:
#   Creates and cleans up the TEMP_DIR.
download_mod() {
    local mod_id="$1"
    local download_source_file="$TEMP_DIR/steamapps/workshop/content/$APP_ID/$mod_id/Vehicle.brv"

    # Ensure the temporary directory exists and is clean for the specific mod
    rm -rf "$TEMP_DIR/steamapps/workshop/content/$APP_ID/$mod_id"
    mkdir -p "$TEMP_DIR"

    log_info "Downloading mod $mod_id..."

    # Execute steamcmd to download the workshop item
    # The +quit command ensures steamcmd exits after the operation.
    steamcmd +login "$MY_LOGIN" +force_install_dir "$TEMP_DIR" +workshop_download_item $APP_ID $mod_id +quit

    # Check if steamcmd command was successful and if the file exists
    if [ $? -eq 0 ] && [ -f "$download_source_file" ]; then
        echo "$download_source_file"
        return 0
    else
        log_error "Failed to download mod $mod_id."
        log_error "Ensure the mod ID is correct and you have access to it."
        return 1
    fi
}
