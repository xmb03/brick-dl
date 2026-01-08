#!/bin/bash

# Configuration settings for the brick-dl script

# Your Steam login username. Replace 'absxlutov' with your actual Steam login.
MY_LOGIN="absxlutov"

# The App ID for Brick Rigs on Steam. This is standard and usually does not need changing.
APP_ID=552100

# The base directory where downloaded mods will be placed within the Heroic Games Launcher Wine prefix.
# IMPORTANT: Replace '/home/your_user/' with your actual username and ensure the path matches your Heroic Games Launcher setup.
# Example for a user named 'gamer': "/home/gamer/Games/Heroic/Prefixes/default/Brick Rigs/drive_c/users/steamuser/AppData/Local/BrickRigs/SavedRemastered/Vehicles"
TARGET_BASE="/home/your_user/Games/Heroic/Prefixes/default/Brick Rigs/drive_c/users/steamuser/AppData/Local/BrickRigs/SavedRemastered/Vehicles"

# Temporary directory for steamcmd downloads. This is a standard temporary location.
TEMP_DIR="/tmp/brick_steamcmd"