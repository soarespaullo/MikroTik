# 🛰️ MikroTik - Scripts, Tutoriais e Configurações

Repositório dedicado à documentação, automação e compartilhamento de scripts para dispositivos MikroTik (RouterOS). O objetivo é centralizar soluções práticas para administração de redes, monitoramento e segurança.

---

## 📂 Estrutura do Repositório

- **/scripts**: Scripts `.rsc` prontos para uso (Failover, Backup, Notificações Telegram).
- **/tutoriais**: Guias passo a passo em Markdown (Configuração de VPN, Hotspot, QoS).
- **/configs**: Exemplos de arquivos de configuração base (`export`).

---

## 🛠️ Conteúdos em Destaque

### 1. Monitoramento & Notificações (Telegram Bot)
Scripts para monitorar o status das interfaces (UP/DOWN) e enviar alertas em tempo real via API do Telegram.
- [**Ver script de notificação PPPoE**](./scripts/telegram-notification.rsc)

### 2. Segurança: Device Mode
Tutorial essencial para liberar permissões de comandos sensíveis (como `/tool fetch`) em versões recentes do RouterOS.
- [**Guia de ativação do Device Mode**](https://github.com/soarespaullo/MikroTik/wiki/Device-Mode) 

### 3. Failover com Netwatch
Configuração de redundância de links utilizando monitoramento por ping em servidores raiz (Google/Cloudflare).
- [**Guia de Failover com Netwatch**](https://github.com/soarespaullo/MikroTik/wiki/Failover-Netwatch)

---

## 🚀 Como usar estes scripts

1. **Acesso via Terminal:** Copie o código do script e cole diretamente no terminal do seu Winbox.
2. **Importação de arquivo:** - Baixe o arquivo `.rsc`.
   - Arraste para a pasta `Files` do MikroTik.
   - Execute no terminal: `/import file-name=script.rsc`.

---

## ⚠️ Avisos Importantes

* **Teste em Bancada:** Nunca aplique scripts de Firewall ou Rotas diretamente em roteadores de produção sem antes testar em um ambiente controlado.
* **Versões:** Os scripts contidos aqui são testados preferencialmente na **RouterOS v7.x**. Verifique a compatibilidade se estiver usando a v6.x.

---

## 🤝 Contribuições

Sinta-se à vontade para abrir uma *Issue* ou enviar um *Pull Request* com melhorias de scripts ou novos tutoriais.

---
**Mantido por:** [Paulo Soares](https://soarespaullo.github.io)  
**Licença:** MIT
