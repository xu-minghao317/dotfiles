# Determine the platform
export OS_TYPE=$(uname -s)

# Include $HOME/.local/bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    path=("$HOME/.local/bin" $path)
fi

if [[ "$OS_TYPE" == "Darwin" ]]; then
    # Init Homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)"

    ### Homebrew config ###
    # Avoid Gatekeeper checks on macOS
    export HOMEBREW_CASK_OPTS='--no-quarantine'
    # Make `brew cleanup` and `brew uninstall` autoremove unneed dependencies
    export HOMEBREW_AUTOREMOVE=true
    # Suppress environment hints, providing a cleaner terminal output
    export HOMEBREW_NO_ENV_HINTS=true
    # Opt-out analytics
    export HOMEBREW_NO_ANALYTICS=true
fi

# Set neovim as default editor
export EDITOR='nvim'
export VISUAL=$EDITOR
