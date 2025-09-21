#!/bin/env bash

curl -sSL 'http://litellm.ai.localhost/v1/models' --header 'Authorization: Bearer sk-1234' --header 'Content-Type: application/json' | jq -c '
    .data |
    # create a new object where all keys with the same model name (last part of the id after "/") are grouped together
    group_by(.id | split("/") | last) |
    map({
      (.[0].id | split("/") | last): [ .[].id ]
    }) |
    add |
    [ "preview", "deprecated", "*", "beta", "embedding", "tts" ] as $bad_words |
    to_entries |
    map(
      select(
        # Filter for full bad words
        (.key | (split("-") + split("_") + split(" ") + split(":")) | unique | any( IN($bad_words[]) )) or
        # Filter for YYYY-MM-DD date format
        (.key | test("\\d{4}-\\d{2}-\\d{2}")) |
        not
      )
    ) |
    from_entries
  ' | jq
