#!/usr/bin/env fish
# fetch.fish - A pure fish shell system information tool
# Displays system information in a colorful format

function fetch --description "Display system information"
    # Colors
    set -l reset (set_color normal)
    set -l bold (set_color --bold)
    set -l blue (set_color blue)
    set -l cyan (set_color cyan)
    set -l green (set_color green)
    set -l magenta (set_color magenta)
    set -l red (set_color red)
    set -l yellow (set_color yellow)
    
    # ASCII Art - Simple fish logo
    set -l ascii_art \
        "       ><> " \
        "     ><))°>" \
        "   ><))°>  " \
        " ><))°>    "
    
    # Get system information
    set -l user (whoami)
    set -l host (get_hostname)
    set -l os_info (get_os_info)
    set -l kernel (uname -r)
    set -l uptime_info (get_uptime)
    set -l shell_info "fish $FISH_VERSION"
    set -l terminal_info $TERM
    set -l cpu_info (get_cpu_info)
    set -l memory_info (get_memory_info)
    
    # Calculate info panel width
    set -l info_lines \
        "$bold $user@$host$reset" \
        "$blue  OS:$reset $os_info" \
        "$blue  Kernel:$reset $kernel" \
        "$blue  Uptime:$reset $uptime_info" \
        "$blue  Shell:$reset $shell_info" \
        "$blue  Terminal:$reset $terminal_info" \
        "$blue  CPU:$reset $cpu_info" \
        "$blue  Memory:$reset $memory_info"
    
    # Display ASCII art and info side by side
    set -l longest_info_line 0
    for i in (seq 1 (count $ascii_art))
	    set longest_info_line $(math max $longest_info_line,$(string length $ascii_art[$i]))
        if test $i -le (count $info_lines)
            echo "$cyan$ascii_art[$i]$reset  $info_lines[$i]"
        else
            echo "$cyan$ascii_art[$i]$reset"
        end
    end

    # Display remaining info lines if any
    if test (count $info_lines) -gt (count $ascii_art)
        for i in (seq (math (count $ascii_art) + 1) (count $info_lines))
            echo $(string repeat $longest_info_line " ") " $info_lines[$i]"
        end
    end
    
    echo ""
end

function get_hostname
    if command -q hostname
    	hostname
    else if test -f /etc/hostname
    	cat /etc/hostname
    else
    	echo "Unknown"
    end
end

function get_os_info
    # Detect OS and distribution
    if test -f /etc/os-release
        grep '^PRETTY_NAME=' /etc/os-release | cut -d'"' -f2
    else if test (uname) = "Darwin"
        echo "macOS $(sw_vers -productVersion)"
    else if test (uname) = "Linux"
        echo "Linux"
    else
        uname -s
    end
end

function get_uptime
    # Get system uptime
    if test -f /proc/uptime
        set -l uptime_seconds (cut -d'.' -f1 /proc/uptime)
        set -l days (math -s0 "$uptime_seconds / 86400")
        set -l hours (math -s0 "($uptime_seconds % 86400) / 3600")
        set -l minutes (math -s0 "($uptime_seconds % 3600) / 60")
        
        if test $days -gt 0
            echo "$days days, $hours hours, $minutes mins"
        else if test $hours -gt 0
            echo "$hours hours, $minutes mins"
        else
            echo "$minutes mins"
        end
    else
        # Fallback for non-Linux systems
        uptime | sed 's/.*up \([^,]*\),.*/\1/'
    end
end

function get_cpu_info
    # Get CPU information
    if test -f /proc/cpuinfo
        set -l cpu_model (grep "model name" /proc/cpuinfo | head -1 | cut -d':' -f2 | string trim)
        set -l cpu_count (grep -c "^processor" /proc/cpuinfo)
        echo "$cpu_model ($cpu_count)"
    else if test (uname) = "Darwin"
        sysctl -n machdep.cpu.brand_string
    else
        echo "Unknown"
    end
end

function get_memory_info
    # Get memory information
    if test -f /proc/meminfo
        set -l mem_total (grep "MemTotal:" /proc/meminfo | awk '{print $2}')
        set -l mem_available (grep "MemAvailable:" /proc/meminfo | awk '{print $2}')
        set -l mem_used (math "$mem_total - $mem_available")
        
        set -l mem_total_mb (math -s0 "$mem_total / 1024")
        set -l mem_used_mb (math -s0 "$mem_used / 1024")
        
        echo "$mem_used_mb MB / $mem_total_mb MB"
    else if test (uname) = "Darwin"
        # macOS memory calculation
        set -l mem_total (sysctl -n hw.memsize)
        set -l mem_total_mb (math -s0 "$mem_total / 1048576")
        echo "$mem_total_mb MB"
    else
        echo "Unknown"
    end
end

