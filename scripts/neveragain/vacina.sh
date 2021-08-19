age=$(curl  "https://covid19.min-saude.pt/pedido-de-agendamento/#error_msg" 2> /dev/null | grep "Tem " | sed -E "s/.*Tem ([0-9]+).*/\1/")
echo "vacinacao acima de $age"
