# --- Configurações do Usuário ---
:local duckdomain "rb-mikrotik"
:local ducktoken "c68lkmnj-29ae-4082-bfed-e7klkqusdfa"
:local inetinterface "pppoe-cliente-proxxima"

# --- Captura do IP Atual ---
:global actualIP [/ip address get [find where interface=$inetinterface] address];
:set actualIP [:pick $actualIP 0 [:find $actualIP "/"]];

# --- Criação do arquivo de backup (se não existir) ---
:if ([:len [/file find where name=ipstore.txt]] < 1 ) do={
 /file print file=ipstore.txt where name=ipstore.txt;
 /delay delay-time=2;
 /file set ipstore.txt contents="0.0.0.0";
};

# --- Comparação e Atualização ---
:local previousIP [/file get [find where name=ipstore.txt] contents];

:if ($previousIP != $actualIP) do={
 :log info ("DuckDNS: Tentando atualizar... Novo IP: " . $actualIP . " - Anterior: " . $previousIP);

 /tool fetch mode=https keep-result=yes dst-path=duckdns-result.txt address=[:resolve www.duckdns.org] port=443 host=www.duckdns.org src-path=("/update?domains=$duckdomain&token=$ducktoken&ip=".$actualIP);

 /delay delay-time=5;
 :local lastChange [/file get [find where name=duckdns-result.txt] contents];

 :if ($lastChange = "OK") do={
    /file set ipstore.txt contents=$actualIP;
    :log warning ("DuckDNS: Atualizado com sucesso! IP: " . $actualIP);
 } else={
    :log error ("DuckDNS: Falha na atualizacao com o IP " . $actualIP);
 };
};
