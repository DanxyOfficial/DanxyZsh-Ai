#!/bin/bash
# CREATOR: DANXY OFFICIAL × PECUT AI
# SALURAN: https://whatsapp.com/channel/0029VaznZlq7z4kW00unHZ0e
# WEBSITE: danxyofficial.web.id
# YOUTUBE: DanxyBot
# TIKTOK: Qwela.38
# NB: Dilarang keras menghapus atau mengubah credit/nama creator.
# Hormati hak cipta dan karya orang lain. DanxyZsh-Ai ini GRATIS,
# dilarang menjual atau memperjualbelikan.


if [ $# -eq 0 ]; then
    echo "Error: Mana pertanyaannya? contoh penggunaan: ai hai"
    exit 1
fi

QUESTION="$*"

M='\033[0;31m'
H='\033[0;32m'
P='\033[1;37m'
NC='\033[0m'
BOLD_WHITE='\033[1;37m'

echo -ne "${P}Menunggu respon AI ${NC}"
while true; do
    for s in / - \\ \|; do
        printf "\r${P}Menunggu respon ${H}AI ${M}%s${NC}" "$s"
        sleep 0.1
    done
done &
SPINNER_PID=$!

RESPONSE=$(curl -s -X POST "https://api-danxy-zsh-ai.vercel.app/api/v1/v2/danxy-ai" \
    -H "Content-Type: application/json" \
    -d "{\"question\":\"$QUESTION\"}")

kill $SPINNER_PID 2>/dev/null
wait $SPINNER_PID 2>/dev/null
printf "\r\033[K"

RESULT=$(echo "$RESPONSE" | jq -r '.result')

echo -e "${BOLD_WHITE}${RESULT}${NC}"
