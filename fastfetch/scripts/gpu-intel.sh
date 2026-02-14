# Intel iGPU
intel_line=$(lspci | grep -Ei "VGA|3D" | grep -i intel | head -n1)

if [[ -n "$intel_line" ]]; then
    name=$(echo "$intel_line" | sed -E 's/.*\[(.*)\].*/\1/')
    name=$(echo "$name" | sed -E 's/Intel Corporation //')
    name=$(echo "$name" | sed -E 's/^Intel //')

    freq=""
    for f in /sys/class/drm/card*/gt_max_freq_mhz; do
        if [[ -r "$f" ]]; then
            mhz=$(cat "$f")
            freq=$(awk "BEGIN{printf \"%.2f\", $mhz/1000}")
            break
        fi
    done

    if [[ -n "$freq" ]]; then
        echo "Intel $name @ $freq GHz [Integrated]"
    else
        echo "Intel $name [Integrated]"
    fi
fi
