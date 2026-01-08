#!/bin/bash

# Module for handling file system operations.

# Imports
source "$(dirname "$0")/config.sh"

# Prepares the destination directory for the mod.
# Arguments:
#   $1: The base directory where the mod will be placed (from config).
#   $2: The randomly generated name for the mod's directory.
# Returns:
#   The full path to the created destination directory on success.
#   Exits with an error code on failure.
prepare_destination_dir() {
    local base_path="$1"
    local random_name="$2"
    local full_dest_path="$base_path/$random_name"

    log_info "Creating destination folder: $full_dest_path"

    # Create the directory, -p ensures no error if it already exists and creates parent directories if needed.
    if mkdir -p "$full_dest_path"; then
        echo "$full_dest_path"
        return 0
    else
        log_error "Failed to create destination folder: $full_dest_path"
        return 1
    fi
}

# Moves the downloaded Vehicle.brv file to its final destination.
# Arguments:
#   $1: The source path of the Vehicle.brv file.
#   $2: The destination path for the Vehicle.brv file.
# Returns:
#   0 on success.
#   1 on failure.
move_vehicle_file() {
    local source_file="$1"
    local dest_file="$2"

    log_info "Moving file '$source_file' to '$dest_file'"

    if mv "$source_file" "$dest_file"; then
        return 0
    else
        log_error "Failed to move file '$source_file' to '$dest_file'."
        return 1
    fi
}

# Sets read, write, and execute permissions for all users on the destination directory.
# Arguments:
#   $1: The path to the directory to set permissions for.
# Returns:
#   0 on success.
#   1 on failure.
set_permissions() {
    local dir_path="$1"

    log_info "Setting permissions (777) for '$dir_path'"

    # Set execute, write, and read permissions for owner, group, and others.
    if chmod -R 777 "$dir_path"; then
        return 0
    else
        log_error "Failed to set permissions for '$dir_path'."
        return 1
    fi
}
