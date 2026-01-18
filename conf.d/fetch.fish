if status is-interactive
	set -g FETCH_CMD "fetch"

	if type -q fish_greeting
		functions --copy fish_greeting fish_greeting_fetch_cpy

		function fish_greeting
			eval $FETCH_CMD
			fish_greeting_fetch_cpy $argv
		end
	else
		function fish_greeting
			eval $FETCH_CMD
		end
	end
end
