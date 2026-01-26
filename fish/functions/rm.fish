function rm --description 'Safe rm - moves to Trash instead of deleting'
    if test (count $argv) -eq 0
        command rm
        return
    end

    # Use macOS `trash` command via Finder (supports Put Back)
    for arg in $argv
        # Skip flags, pass through to handle non-existent files etc.
        if string match -q -- '-*' $arg
            continue
        end

        if test -e $arg
            osascript -e "tell application \"Finder\" to delete POSIX file \"$(realpath $arg)\"" >/dev/null 2>&1
        else
            echo "rm: $arg: No such file or directory"
        end
    end
end
