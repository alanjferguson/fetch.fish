#!/usr/bin/env fish
# Installation script for fetch.fish
# Run with: fish install.fish

set -l fish_config_dir "$HOME/.config/fish"
set -l install_dir (dirname (status --current-filename))

echo "Installing fetch.fish..."

# Create necessary directories
mkdir -p "$fish_config_dir/functions"
mkdir -p "$fish_config_dir/completions"
mkdir -p "$fish_config_dir/conf.d"

# Copy functions
echo "Installing functions..."
if test -f "$install_dir/functions/fetch.fish"
    cp "$install_dir/functions/fetch.fish" "$fish_config_dir/functions/"
    or begin
        echo "Error: Failed to copy fetch.fish"
        exit 1
    end
else
    echo "Error: Source file functions/fetch.fish not found"
    exit 1
end

if test -f "$install_dir/functions/fish_greeting.fish"
    cp "$install_dir/functions/fish_greeting.fish" "$fish_config_dir/functions/"
    or begin
        echo "Error: Failed to copy fish_greeting.fish"
        exit 1
    end
else
    echo "Error: Source file functions/fish_greeting.fish not found"
    exit 1
end

# Copy completions
echo "Installing completions..."
if test -f "$install_dir/completions/fetch.fish"
    cp "$install_dir/completions/fetch.fish" "$fish_config_dir/completions/"
    or begin
        echo "Error: Failed to copy completions"
        exit 1
    end
else
    echo "Error: Source file completions/fetch.fish not found"
    exit 1
end

# Copy configuration
echo "Installing configuration..."
if not test -f "$fish_config_dir/conf.d/fetch.fish"
    if test -f "$install_dir/conf.d/fetch.fish"
        cp "$install_dir/conf.d/fetch.fish" "$fish_config_dir/conf.d/"
        or begin
            echo "Warning: Failed to copy configuration file"
        end
    else
        echo "Warning: Source file conf.d/fetch.fish not found"
    end
end

echo ""
echo "✓ fetch.fish installed successfully!"
echo ""
echo "You can now:"
echo "  • Start a new fish shell to see the greeting"
echo "  • Run 'fetch' command manually"
echo "  • Customize the greeting by editing ~/.config/fish/functions/fish_greeting.fish"
echo ""
