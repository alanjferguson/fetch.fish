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
cp "$install_dir/functions/fetch.fish" "$fish_config_dir/functions/"
cp "$install_dir/functions/fish_greeting.fish" "$fish_config_dir/functions/"

# Copy completions
echo "Installing completions..."
cp "$install_dir/completions/fetch.fish" "$fish_config_dir/completions/"

# Copy configuration
echo "Installing configuration..."
if not test -f "$fish_config_dir/conf.d/fetch.fish"
    cp "$install_dir/conf.d/fetch.fish" "$fish_config_dir/conf.d/"
end

echo ""
echo "✓ fetch.fish installed successfully!"
echo ""
echo "You can now:"
echo "  • Start a new fish shell to see the greeting"
echo "  • Run 'fetch' command manually"
echo "  • Customize the greeting by editing ~/.config/fish/functions/fish_greeting.fish"
echo ""
