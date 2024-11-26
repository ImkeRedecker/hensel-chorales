#!/bin/bash
for filename in ./kern/*.krn; do
    cat "$filename" \
        | shed -x "text" -e "s/'/’/g" \
        | shed -x "kern" -e "s/LL/L/g" \
        | shed -x "kern" -e "s/JJ/J/g" \
        | sed 's/=-/=/g' \
        | sed '/!!linebreak:original/d' \
        | sed '/!!pagebreak:original/d' \
        | echo -n "$(cat)" > "$filename.tmp"
	mv "$filename.tmp" "$filename"
done
