#!/bin/bash
#===============================================================================
# Script Name: arch_party.sh
# Description: This script defines a collection of pastel and varied color schemes
#              for terminal output styling. It's designed to provide aesthetic 
#              color combinations for ASCII art and terminal text customization
#              in Arch Linux environments.
#
# Author: Miguel Euraque
# Date Created: 2025-01-19
# Version: 1.0.1
# License: GPLv3 License
#
# Logo Attribution:
#   Created by: Sivert3
#   Published: 2014-11-16
#   Source: https://bbs.archlinux.org/viewtopic.php?id=189937
#===============================================================================

# Pastel and varied color tones
COLORS=(
    "\e[38;5;153m" # Pastel blue
    "\e[38;5;109m" # Pastel green
    "\e[38;5;110m" # Pastel turquoise
    "\e[38;5;147m" # Pastel lilac
    "\e[38;5;225m" # Light pastel pink
    "\e[38;5;186m" # Pastel yellow
    "\e[38;5;33m"  # Light blue
    "\e[38;5;34m"  # Mint green
    "\e[38;5;45m"  # Bright blue
    "\e[38;5;81m"  # Dark purple
    "\e[38;5;137m" # Soft orange
    "\e[38;5;194m" # Soft red
    "\e[38;5;198m" # Bright fuchsia
    "\e[38;5;220m" # Bright yellow
    "\e[38;5;214m" # Bright orange
    "\e[38;5;119m" # Lime green
    "\e[38;5;88m"  # Dark green
    "\e[38;5;51m"  # Soft cyan
    "\e[38;5;44m"  # Ocean blue
    "\e[38;5;229m" # Dark lilac
    "\e[38;5;166m" # Intense red
    "\e[38;5;136m" # Soft brown
    "\e[38;5;160m" # Dark red
    "\e[38;5;40m"  # Olive green
    "\e[38;5;159m" # Dark orange
    "\e[38;5;42m"  # Emerald green
    "\e[38;5;121m" # Pastel purple
    "\e[38;5;35m"  # Midnight blue
    "\e[38;5;72m"  # Light green
)

# Fixed Arch Linux logo
ARCH_LOGO="
          .
         / \\
        /   \\
       /^.   \\
      /  .-.  \\
     /  (   )  \\
    / _.~   ~._ \\
   /.^         ^.\\
"

# Function to center text in the terminal
function center_text() {
    text=$1
    term_height=$(tput lines)
    term_width=$(tput cols)
    lines_count=$(echo "$text" | wc -l)
    max_line_width=$(echo "$text" | awk '{print length}' | sort -nr | head -1)

    # Calculate coordinates to center
    y=$(( (term_height - lines_count) / 2 ))
    x=$(( (term_width - max_line_width) / 2 ))

    # Print each line with appropriate offset
    echo "$text" | while IFS= read -r line; do
        tput cup "$y" "$x"
        echo -e "$line"
        y=$((y + 1))
    done
}

# Function to generate animated shapes around the logo
function animate_shapes() {
    term_height=$(tput lines)
    term_width=$(tput cols)
    shapes=("*" "+" "#" "o" "." "x" "@" "&" "%" "$" "!" "?" ";" ":" "-" "=" "~" "^" "<" ">" "|" "\\" "/" "{" "}")
    max_x=$((term_width - 2))
    max_y=$((term_height - 2))

    for ((i = 0; i < 15; i++)); do
        shape=${shapes[RANDOM % ${#shapes[@]}]}
        x=$((RANDOM % max_x))
        y=$((RANDOM % max_y))
        color=${COLORS[RANDOM % ${#COLORS[@]}]}

        tput cup "$y" "$x"
        echo -ne "${color}${shape}\e[0m"
    done
}

# Make the terminal non-blocking for input
stty -echo -icanon time 0 min 0

# Main loop
while true; do
    clear

    # Change logo color
    logo_color=${COLORS[RANDOM % ${#COLORS[@]}]}
    center_text "${logo_color}${ARCH_LOGO}\e[0m"

    # Generate animations
    animate_shapes

    # Check for 'q' key press to quit
    read -n 1 -t 0.1 key
    if [[ $key == "q" ]]; then
        clear
        tput cnorm  # Show cursor
        stty echo   # Restore terminal settings
        break
    fi
done

# Restore terminal settings on exit
tput cnorm
stty echo
