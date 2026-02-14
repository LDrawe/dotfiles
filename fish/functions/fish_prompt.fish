function fish_prompt

    # cores
    set -l orange (set_color -o brmagenta)
    set -l yellow (set_color brgreen)
    set -l green  (set_color brcyan)
    set -l cyan   (set_color cyan)
    set -l white  (set_color normal)
    set -l bold   (set_color --bold)

    # eduardo
    printf "%s%s%s" $bold $orange $USER

    # at acer
    printf "%s at %s%s" $white $yellow (prompt_hostname)

    # in  path
    printf "%s in %s %s" $white $green (prompt_pwd)

    # on git
    set -l gitinfo (_git_segment)
    if test -n "$gitinfo"
        printf "%s on %s%s" $white $cyan $gitinfo
    end

    # nova linha
    printf "\n"

    # prompt final
    printf "%s\$ %s" $white (set_color normal)
end
