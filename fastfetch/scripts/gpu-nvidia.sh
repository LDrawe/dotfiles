#!/usr/bin/env bash

nvidia-smi \
  --query-gpu=name,memory.total,temperature.gpu \
  --format=csv,noheader,nounits 2>/dev/null |
while IFS=',' read -r name mem temp; do
    name=$(xargs <<<"$name")
    mem=$(xargs <<<"$mem")
    temp=$(xargs <<<"$temp")

    mem_gib=$(awk "BEGIN{printf \"%.1f\", $mem/1024}")

    echo "$name [$mem_gib GiB] | ${temp}°C [Discrete]"
done
