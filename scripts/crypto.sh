#!/bin/bash

print_notify(){
    notify-send "$1" -t 0 | awk '{ printf("%s\n",$0)}'
    echo "$1"
}

declare -A cryptos=(["BTC"]=0.00034671 ["ETH"]=0.00869288 ["XLM"]=19.1976887 )
sum=0
CRYPTO_API_KEY=$(cat "$HOME/.local/api/crypto")

cache_file=${XDG_CACHE_HOME:-~/.cache}/crypto

last_run=$(cat "$cache_file" 2>/dev/null)

tee "$cache_file" < /dev/null

compare() {
    last_wealth=$(grep "$1" <<<"$last_run" | cut -d':' -f2)
    if [[ "$last_wealth" ]]; then
        printf '['
        if (( $(echo "$last_wealth < $2" | bc -l) )); then
            printf "^"
        elif (( $(echo "$last_wealth > $2" | bc -l) )); then
            printf "v"
        else
            printf "="
        fi
        echo ']'
    fi
}

dunstctl close-all
for crypto in "${!cryptos[@]}"; do
    price=$(curl -sH "$CRYPTO_API_KEY" -H\
         "Accept: application/json" -d "" \
        -G https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest \
        -d 'convert=EUR&symbol=BTC,ETH,XLM' | jq -r ".data.$crypto.quote.EUR.price")
    wealth=$(echo "$price" "${cryptos[$crypto]}" | awk -M -v PREC=6 '{printf("%.5f\n",$1*$2)}')
    print_notify "$crypto : $wealth € $(compare "$crypto" "$wealth")"
    echo "$crypto:$wealth" >> "$cache_file"
    sum=$(echo "$sum" "$wealth" | awk '{print $1 + $2}')
done

echo "total:$sum" >> "$cache_file"
print_notify "Total : $sum € $(compare total "$sum")"
