# brick-dl.sh

A modular Bash script designed to automate the download and installation of Brick Rigs workshop mods using `steamcmd`. It intelligently places downloaded mods into the correct directory within a Heroic Games Launcher Wine prefix, ensuring compatibility and ease of use.

This script has been refactored into a modular structure for better organization, maintainability, and robustness.

## Description

This script automates the process of downloading mods from the Steam Workshop for Brick Rigs and placing them into the game's user directory when the game is installed via Heroic Games Launcher. It employs a modular approach, with individual functions separated into files within the `modules/` directory.

## Folder Structure

```
brick-dl/
├── brick-dl.sh         # The main orchestrator script.
├── modules/
│   ├── config.sh       # Contains all configuration variables.
│   ├── download.sh     # Functions for downloading mods using steamcmd.
│   ├── file_ops.sh     # Functions for file system operations (directory creation, moving, permissions).
│   ├── logging.sh      # Functions for formatted output messages (info, error, success).
│   └── utils.sh        # Utility functions, such as random name generation.
└── README.md           # This file, describing the script and its structure.
└── README_RU.md        # Russian version of this README.
```

## Usage

1.  **Configuration (`modules/config.sh`):**
    *   Open `modules/config.sh` in a text editor.
    *   **Crucially, update `MY_LOGIN`** to your actual Steam login username.
    *   **IMPORTANT: Modify `TARGET_BASE`** to point to the correct Brick Rigs save directory within your Heroic Games Launcher Wine prefix. Replace `/home/your_user/` with your actual username and path.
        *   **Example:** For a user named `gamer`, it might look like this:
            ```
            TARGET_BASE="/home/gamer/Games/Heroic/Prefixes/default/Brick Rigs/drive_c/users/steamuser/AppData/Local/BrickRigs/SavedRemastered/Vehicles"
            ```
    *   `APP_ID` (552100) and `TEMP_DIR` (/tmp/brick_steamcmd) typically do not require changes.

2.  **Prerequisites:**
    *   `steamcmd` must be installed and accessible in your system's PATH.
    *   Heroic Games Launcher must be installed, and Brick Rigs configured within it.
    *   A valid Steam account and login are required.

3.  **Running the Script:**
    *   Make the main script `brick-dl.sh` executable:
        ```bash
        chmod +x brick-dl.sh
        ```
    *   Execute the script, providing the Steam Workshop Mod ID as an argument:
        ```bash
        ./brick-dl.sh <MOD_ID>
        ```
        For example:
        ```bash
        ./brick-dl.sh 1234567890
        ```

## How to get a Mod ID?

The Mod ID can be found in the URL of the mod's page on the Steam Workshop. For example, in the URL `https://steamcommunity.com/sharedfiles/filedetails/?id=1234567890`, the Mod ID is `1234567890`.

## Example Workflow

```bash
./brick-dl.sh 1234567890

# Expected Output:
# [INFO] Downloading mod 1234567890...
# [INFO] Creating destination directory: /home/your_user/Games/Heroic/Prefixes/default/Brick Rigs/drive_c/users/steamuser/AppData/Local/BrickRigs/SavedRemastered/Vehicles/9876543210
# [INFO] Moving file '/tmp/brick_steamcmd/steamapps/workshop/content/552100/1234567890/Vehicle.brv' to '/home/your_user/Games/Heroic/Prefixes/default/Brick Rigs/drive_c/users/steamuser/AppData/Local/BrickRigs/SavedRemastered/Vehicles/9876543210/Vehicle.brv'
# [INFO] Setting permissions (777) for '/home/your_user/Games/Heroic/Prefixes/default/Brick Rigs/drive_c/users/steamuser/AppData/Local/BrickRigs/SavedRemastered/Vehicles/9876543210'
# [SUCCESS] Mod 1234567890 downloaded and installed successfully.
# [SUCCESS] It has been saved in folder: 9876543210
```

## License

This script is provided under the [MIT License](LICENSE). Feel free to use, modify, and distribute it.

---

*   *This README was generated automatically. Please ensure all paths and configurations in `modules/config.sh` are correctly set for your environment.*
