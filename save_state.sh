#!/bin/bash

# Diretório para salvar o estado
STATE_DIR="$HOME/.sway_workspace_state"
mkdir -p "$STATE_DIR"

# Arquivo para armazenar o estado dos workspaces
WORKSPACES_FILE="$STATE_DIR/workspaces.json"

# Arquivo para armazenar o estado das janelas
WINDOWS_FILE="$STATE_DIR/windows.json"

# Salvar o estado dos workspaces
swaymsg -t get_workspaces > "$WORKSPACES_FILE"

# Salvar o estado das janelas e workspaces
swaymsg -t get_tree > "$WINDOWS_FILE"

echo "Estado salvo em $WORKSPACES_FILE e $WINDOWS_FILE"

