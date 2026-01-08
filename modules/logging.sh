#!/bin/bash

# Module for handling logging and user messages.

# Define ANSI color codes for better readability
COLOR_RESET="\033[0m"
COLOR_RED="\033[0;31m"
COLOR_GREEN="\033[0;32m"
COLOR_YELLOW="\033[0;33m"
COLOR_BLUE="\033[0;34m"

# Logs an informational message.
# Arguments:
#   $1: The message string to log.
log_info() {
    echo -e "${COLOR_BLUE}[INFO]${COLOR_RESET} $1"
}

# Logs an error message.
# Arguments:
#   $1: The error message string to log.
log_error() {
    echo -e "${COLOR_RED}[ERROR]${COLOR_RESET} $1" >&2 # Send errors to stderr
}

# Logs a success message.
# Arguments:
#   $1: The success message string to log.
log_success() {
    echo -e "${COLOR_GREEN}[SUCCESS]${COLOR_RESET} $1"
}

# Logs a warning message.
# Arguments:
#   $1: The warning message string to log.
log_warning() {
    echo -e "${COLOR_YELLOW}[WARNING]${COLOR_RESET} $1"
}

# Displays the usage instructions for the script.
# Arguments:
#   $1: The script name (e.g., "./brick-dl.sh").
log_usage() {
    log_error "Usage: $1 <MOD_ID>"
    log_error "Example: $1 1234567890"
}
