# Example Output

Here's what fetch.fish looks like when you run it:

```
       ><>  username@hostname
     ><))°>   OS: Ubuntu 24.04.3 LTS
   ><))°>   Kernel: 6.11.0-1018-azure
 ><))°>   Uptime: 2 hours, 15 mins
            Shell: fish 3.7.0
            Terminal: xterm-256color
            CPU: Intel Core i7-9700K (8)
            Memory: 4096 MB / 16384 MB

```

The output includes:
- A colorful ASCII fish logo (in cyan)
- User and hostname (in bold)
- Operating system information
- Kernel version
- System uptime
- Shell version
- Terminal type
- CPU model and core count
- Memory usage

## As a Fish Greeting

When installed, fetch.fish automatically runs when you start a new fish shell session, providing a quick overview of your system at a glance.

## Customization

You can customize the greeting by editing `~/.config/fish/functions/fish_greeting.fish`:

```fish
function fish_greeting
    # Call fetch unconditionally
    fetch
    
    # Or add conditions
    # if not set -q SSH_CONNECTION
    #     fetch
    # end
end
```

To disable the greeting entirely:

```fish
function fish_greeting
    # Empty function disables the greeting
end
```

Or set an environment variable in your `~/.config/fish/config.fish`:

```fish
set -g fish_greeting
```
