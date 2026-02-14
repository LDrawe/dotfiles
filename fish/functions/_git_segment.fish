function _git_segment
    # precisa estar dentro de um repositório
    command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    or return

    # 1) tag exata
    set -l tag (command git describe --tags --exact-match 2>/dev/null)
    if test -n "$tag"
        printf " %s" $tag
        return
    end

    # 2) branch normal
    set -l branch (command git symbolic-ref --short HEAD 2>/dev/null)
    if test -n "$branch"
        printf " %s" $branch
        return
    end

    # 3) detached head
    set -l commit (command git rev-parse --short HEAD 2>/dev/null)
    if test -n "$commit"
        printf "➦ %s" $commit
        return
    end
end
