function __fish_mise_needs_command
    set -l cmd (commandline -opc)
    if test (count $cmd) -eq 1
        return 0
    end
    return 1
end

# Adding completions for mise commands
if command -v mise >/dev/null
    mise completion fish | source
end