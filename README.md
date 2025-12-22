# fetch.fish

A pure fish shell system information tool that displays system information in a colorful format. Replacement for pfetch/fastfetch/neofetch/macchina et al.

## Features

- 🐟 Pure fish shell implementation - no external dependencies
- 🎨 Colorful output with ASCII art
- ⚡ Fast and lightweight
- 🖥️ Displays system information including:
  - OS/Distribution
  - Hostname
  - Kernel version
  - Uptime
  - Shell version
  - Terminal
  - CPU information
  - Memory usage

## Installation

### Manual Installation

1. Clone this repository:
```bash
git clone https://github.com/alanjferguson/fetch.fish.git
```

2. Copy the functions to your fish functions directory:
```bash
cp fetch.fish/functions/*.fish ~/.config/fish/functions/
```

### Using Fisher

```bash
fisher install alanjferguson/fetch.fish
```

### Using Oh My Fish

```bash
omf install https://github.com/alanjferguson/fetch.fish
```

## Usage

### As a Greeting

By default, fetch.fish sets itself as your fish greeting, so it will automatically display when you start a new fish shell session.

### Manual Invocation

You can also call `fetch` manually at any time:

```bash
fetch
```

### Disabling the Greeting

If you want to disable the automatic greeting, add this to your `~/.config/fish/config.fish`:

```fish
function fish_greeting
    # Leave empty to disable greeting
end
```

Or call fetch conditionally:

```fish
function fish_greeting
    # Only show on local sessions
    if not set -q SSH_CONNECTION
        fetch
    end
end
```

## Configuration

Currently, fetch.fish uses sensible defaults. Future versions may include customization options for:
- Color schemes
- Information fields to display
- ASCII art selection

## Requirements

- Fish shell 3.0 or later
- Standard Unix utilities (uname, hostname, grep, awk)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - see [LICENSE](LICENSE) file for details.
