# --- CONFIGURAÇÕES DE TEXTO (Edite apenas aqui) ---
:local sysName [/system identity get name]
:local msgAssunto ("Backup Automatico - " . $sysName)
:local msgCorpo "Relatorio de Backup do Concentrador:\n\n"
:local msgAssinatura "\n\nAtt, \nEquipe de Rede - @soarespaullo"

# --- VARIÁVEIS DO SISTEMA ---
:local sysVer [/system resource get version]
:local sysDate [/system clock get date]
:local sysTime [/system clock get time]
:local fileName ($sysName . ".rsc")
:local mailTo [/tool e-mail get user]

# --- LÓGICA DE BUSCA DE IP (PPPoE ou Rota Default) ---
:local sysAddr "IP nao identificado"
:do {
    :local rawAddr [/ip address get [find interface~"pppoe"] address]
    :set sysAddr [:pick $rawAddr 0 [:find $rawAddr "/"]]
} on-error={ 
    :do {
        :local defaultGW [/ip route get [find dst-address=0.0.0.0/0] gateway-interface]
        :local rawAddr [/ip address get [find interface=$defaultGW] address]
        :set sysAddr [:pick $rawAddr 0 [:find $rawAddr "/"]]
    } on-error={ :set sysAddr "IP Interno/Nao identificado" }
}

# --- EXECUÇÃO ---
/log warning "Iniciando Script de Backup."

# Gera o arquivo
/export terse file=$fileName
/delay 5

# Montagem dinâmica do corpo do e-mail
:local corpoFinal ($msgCorpo . "Nome: " . $sysName . "\nEndereco: " . $sysAddr . "\nVersao: " . $sysVer . "\nData: " . $sysDate . " - " . $sysTime . $msgAssinatura)

/log info "Enviando backup por e-mail para: $mailTo"

# Envio do e-mail
/tool e-mail send file=$fileName to=$mailTo subject=$msgAssunto body=$corpoFinal

/delay 5
/log info "Script de Backup finalizado com sucesso."
