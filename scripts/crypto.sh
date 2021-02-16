#!/bin/bash

print_notify(){
    notify-send "$1" -t 0 | awk '{ printf("%s\n",$0)}'
    echo "$1"
}

declare -A cryptos=(["BTC"]=0.00034671 ["ETH"]=0.00869288 ["XLM"]=19.1976887 )
sum=0
CRYPTO_API_KEY=$(cat "$HOME/.local/api/crypto")

for crypto in "${!cryptos[@]}"; do
    price=$(curl -sH "$CRYPTO_API_KEY" -H\
         "Accept: application/json" -d "" \
        -G https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest \
        -d 'convert=EUR&symbol=BTC,ETH,XLM' | jq -r ".data.$crypto.quote.EUR.price")
    wealth=$(echo "$price" "${cryptos[$crypto]}" | awk -M -v PREC=6 '{printf("%.5f\n",$1*$2)}')
    print_notify "$crypto : $wealth €"
    sum=$(echo "$sum" "$wealth" | awk '{print $1 + $2}')
done

print_notify "Total : $sum €"
