#!/usr/bin/env fish
# Uninstallation script for fetch.fish
# Run with: fish uninstall.fish

set -l fish_config_dir "$HOME/.config/fish"

echo "Uninstalling fetch.fish..."

# Remove functions
if test -f "$fish_config_dir/functions/fetch.fish"
    rm "$fish_config_dir/functions/fetch.fish"
    echo "Removed fetch.fish function"
end

if test -f "$fish_config_dir/functions/fish_greeting.fish"
    echo "Note: fish_greeting.fish was installed by fetch.fish"
    echo "If you want to remove it, run: rm $fish_config_dir/functions/fish_greeting.fish"
end

# Remove completions
if test -f "$fish_config_dir/completions/fetch.fish"
    rm "$fish_config_dir/completions/fetch.fish"
    echo "Removed fetch.fish completions"
end

# Remove configuration (ask first)
if test -f "$fish_config_dir/conf.d/fetch.fish"
    echo "Note: Configuration file at $fish_config_dir/conf.d/fetch.fish was not removed"
    echo "Remove it manually if you want to: rm $fish_config_dir/conf.d/fetch.fish"
end

echo ""
echo "✓ fetch.fish uninstalled successfully!"
echo ""
