#!/bin/bash

# Diretório onde o estado foi salvo
STATE_DIR="$HOME/.sway_workspace_state"
WORKSPACES_FILE="$STATE_DIR/workspaces.json"
WINDOWS_FILE="$STATE_DIR/windows.json"

# Verifica se os arquivos de estado existem
if [ ! -f "$WORKSPACES_FILE" ] || [ ! -f "$WINDOWS_FILE" ]; then
    echo "Arquivos de estado não encontrados!"
    exit 1
fi

# Restaurar os workspaces
while read -r workspace; do
    swaymsg "workspace $workspace"
done < <(jq -r '.[] | .name' "$WORKSPACES_FILE")

# Restaurar as janelas (isso pode precisar de ajustes específicos)
# Note: Restaurar a posição e tamanho das janelas é mais complexo
# e pode exigir processamento adicional do JSON.
jq -c '.nodes[] | select(.type == "con")' "$WINDOWS_FILE" | while read -r window; do
    # Exemplo básico: mover a janela para o workspace correto
    # Pode precisar de comandos adicionais para restaurar o layout e a posição
    # swaymsg "[id=$(echo "$window" | jq -r .id)] move container to workspace $(echo "$window" | jq -r .workspace.name)"
    echo "$window"
done

echo "Estado restaurado a partir de $WORKSPACES_FILE e $WINDOWS_FILE"

