#!/bin/bash
USERS="CTF_User.csv"
SUBMISSIONS="CTF_Submissions.csv"
EMAILS="emails.txt"

mapfile -t < <(cat <(awk -F, '{print $1}' "$USERS") <(awk -F, '{print $3}' "$SUBMISSIONS") |
    sort -n | uniq -d )

for id in "${MAPFILE[@]}"; do
    echo "^$id.*" | grep -f - "$USERS"  | awk -F, '{print $6}' >> "$EMAILS"
done
