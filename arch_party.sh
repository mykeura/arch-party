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
# Version: 1.0
# License: MIT License
#
# Logo Attribution:
#   Created by: Sivert3
#   Published: 2014-11-16
#   Source: https://bbs.archlinux.org/viewtopic.php?id=189937
#
# Copyright (c) 2025 Miguel Euraque
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction.
#===============================================================================

# Colores pastel y tonos variados
COLORS=(
    "\e[38;5;153m" # Azul pastel
    "\e[38;5;109m" # Verde pastel
    "\e[38;5;110m" # Turquesa pastel
    "\e[38;5;147m" # Lila pastel
    "\e[38;5;225m" # Rosa pastel claro
    "\e[38;5;186m" # Amarillo pastel
    "\e[38;5;33m"  # Azul claro
    "\e[38;5;34m"  # Verde menta
    "\e[38;5;45m"  # Azul brillante
    "\e[38;5;81m"  # Púrpura oscuro
    "\e[38;5;137m" # Naranja suave
    "\e[38;5;194m" # Rojo suave
    "\e[38;5;198m" # Fucsia brillante
    "\e[38;5;220m" # Amarillo brillante
    "\e[38;5;214m" # Naranja brillante
    "\e[38;5;119m" # Verde limón
    "\e[38;5;88m"  # Verde oscuro
    "\e[38;5;51m"  # Cyan suave
    "\e[38;5;44m"  # Azul oceánico
    "\e[38;5;229m" # Lila oscuro
    "\e[38;5;166m" # Rojo intenso
    "\e[38;5;136m" # Marrón suave
    "\e[38;5;160m" # Rojo oscuro
    "\e[38;5;40m"  # Verde oliva
    "\e[38;5;159m" # Naranja oscuro
    "\e[38;5;42m"  # Verde esmeralda
    "\e[38;5;121m" # Púrpura pastel
    "\e[38;5;35m"  # Azul medianoche
    "\e[38;5;72m"  # Verde claro
)

# Logotipo fijo de Arch Linux
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

# Función para centrar el texto en el terminal
function center_text() {
    text=$1
    term_height=$(tput lines)
    term_width=$(tput cols)
    lines_count=$(echo "$text" | wc -l)
    max_line_width=$(echo "$text" | awk '{print length}' | sort -nr | head -1)

    # Calcular coordenadas para centrar
    y=$(( (term_height - lines_count) / 2 ))
    x=$(( (term_width - max_line_width) / 2 ))

    # Imprimir cada línea con el desplazamiento adecuado
    echo "$text" | while IFS= read -r line; do
        tput cup "$y" "$x"
        echo -e "$line"
        y=$((y + 1))
    done
}

# Función para generar formas animadas alrededor del logo
function animate_shapes() {
    term_height=$(tput lines)
    term_width=$(tput cols)
    shapes=("*" "+" "#" "o")
    max_x=$((term_width - 2))
    max_y=$((term_height - 2))

    for ((i = 0; i < 10; i++)); do
        shape=${shapes[RANDOM % ${#shapes[@]}]}
        x=$((RANDOM % max_x))
        y=$((RANDOM % max_y))
        color=${COLORS[RANDOM % ${#COLORS[@]}]}

        tput cup "$y" "$x"
        echo -ne "${color}${shape}\e[0m"
    done
}

# Bucle principal
while true; do
    clear

    # Cambiar el color del logotipo
    logo_color=${COLORS[RANDOM % ${#COLORS[@]}]}
    center_text "${logo_color}${ARCH_LOGO}\e[0m"

    # Generar animaciones
    animate_shapes

    sleep 0.1
done
