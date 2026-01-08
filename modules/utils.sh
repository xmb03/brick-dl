#!/bin/bash

# Utility functions for the brick-dl script.

# Generates a random 10-digit name.
# This is used to create unique directory names for downloaded mods.
# Returns:
#   A string representing a 10-digit random number.
generate_random_name() {
    shuf -i 1000000000-9999999999 -n 1
}
