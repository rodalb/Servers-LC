<<<<<<< HEAD
# Servers-LC
=======
# Last Chaos Server - Episode 4 (2015) & Episode 7 (2018)

[![License](https://img.shields.io/badge/license-GPL--3.0-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Linux%2064--bit-lightgrey.svg)]()
[![Episode 4](https://img.shields.io/badge/Episode%204-2015-green.svg)]()
[![Episode 7](https://img.shields.io/badge/Episode%207-2018-orange.svg)]()

Servidor Last Chaos 64-bit para Linux, baseado no código fonte oficial 2015/2018.

## 📋 Índice

- [Sobre](#sobre)
- [Versões Disponíveis](#versões-disponíveis)
- [Requisitos](#requisitos)
- [Instalação Rápida](#instalação-rápida)
- [Configuração](#configuração)
- [Documentação](#documentação)
- [Suporte](#suporte)

## 🎮 Sobre

Este repositório contém os servidores Last Chaos compilados e prontos para uso:

- **Episode 4 (2015)** - Versão estável e testada
- **Episode 7 (2018)** - Versão mais recente com novos recursos

### Características

✅ Servidor 64-bit otimizado  
✅ Compatível com Debian, Ubuntu, Gentoo  
✅ Suporte para GCC-12 e Clang-16  
✅ Bancos de dados MySQL incluídos  
✅ Scripts de instalação automatizados  
✅ Documentação completa em português  
✅ Suporte para múltiplos canais  

## 📦 Versões Disponíveis

### Episode 4 (2015)
- **Level Máximo:** 400
- **Mapas:** Dratan, Merac, Juno, Uruga
- **Classes:** 6 classes (Titan, Knight, Healer, Mage, Rogue, Sorcerer)
- **Estabilidade:** ⭐⭐⭐⭐⭐
- **Recomendado para:** Produção

### Episode 7 (2018)
- **Level Máximo:** 450+
- **Mapas:** Todos do EP4 + novos mapas
- **Classes:** 6 classes com melhorias
- **Estabilidade:** ⭐⭐⭐⭐
- **Recomendado para:** Testes e novos recursos

## 💻 Requisitos

### Sistema Operacional
- Ubuntu 20.04+ / Debian 11+ / Gentoo
- Arquitetura: x86_64 (64-bit)
- RAM: 4GB mínimo, 8GB recomendado
- Disco: 10GB livres

### Dependências
```bash
# Debian/Ubuntu
sudo apt install -y \
    libapr1-dev \
    libaprutil1-dev \
    liblog4cxx-dev \
    libsqlite3-dev \
    libcurl4-openssl-dev \
    libjsoncpp-dev \
    libbotan-2-dev \
    libboost-all-dev \
    libmysqlclient-dev \
    mysql-server
```

## 🚀 Instalação Rápida

### Episode 4 (2015)

```bash
# 1. Clone o repositório
git clone https://github.com/rodalb/Servers-LC.git
cd Servers-LC/LC2015

# 2. Instale dependências
sudo bash Scripts/install-deps.sh

# 3. Configure IP e senha MySQL
bash Scripts/set-ip.sh SEU_IP_AQUI
bash Scripts/set-pass.sh SUA_SENHA_MYSQL

# 4. Importe bancos de dados
bash Scripts/import-databases.sh

# 5. Inicie o servidor
bash Scripts/run-server.sh start
```

### Episode 7 (2018)

```bash
cd Servers-LC/LC2018
# Mesmos passos acima
```

## ⚙️ Configuração

### Configurar IP do Servidor

```bash
bash Scripts/set-ip.sh 192.168.1.100
```

### Configurar Senha MySQL

```bash
bash Scripts/set-pass.sh minhasenha123
```

### Portas Utilizadas

| Servidor | Porta | Descrição |
|----------|-------|-----------|
| Messenger | 4112 | Comunicação entre servidores |
| Helper | 3000 | Sistema de ajuda |
| SubHelper | 50401 | Helper secundário |
| Connector | 4006 | Conexão Login/Game |
| LoginServer | 4001 | Login de jogadores |
| GameServer | 4101 | Jogo principal |

### Criar Conta de Admin

```bash
mysql -uroot -p ep4_db_auth << 'EOF'
INSERT INTO bg_user (user_id, passwd, activated, chk_service, partner_id, create_date) 
VALUES ('admin', 'admin123', 1, 'Y', 'LC', NOW());
EOF
```

## 📚 Documentação

- [Instalação Completa](docs/INSTALACAO.md)
- [Configuração Avançada](docs/CONFIGURACAO.md)
- [Solução de Problemas](docs/TROUBLESHOOTING.md)
- [FAQ - Perguntas Frequentes](docs/FAQ.md)
- [Comandos GM](docs/COMANDOS_GM.md)

## 🔧 Gerenciamento do Servidor

### Iniciar Servidor
```bash
bash Scripts/run-server.sh start
```

### Parar Servidor
```bash
bash Scripts/run-server.sh stop
```

### Reiniciar Servidor
```bash
bash Scripts/run-server.sh restart
```

### Ver Status
```bash
bash Scripts/run-server.sh status
```

### Ver Logs
```bash
# Login Server
tail -f Server.x64/LogFiles/Login.log

# Game Server
tail -f Server.x64/LogFiles/Gameserver_1_1.log
```

## 🐛 Solução de Problemas

### Erro: "Account ID is in use"

```bash
bash Scripts/limpar-sessoes.sh
```

### Servidor não inicia

1. Verifique se todas as dependências estão instaladas
2. Verifique se o MySQL está rodando: `sudo systemctl status mysql`
3. Verifique os logs em `Server.x64/LogFiles/`

### Cliente não conecta

1. Verifique se o IP está correto no cliente
2. Verifique se as portas estão abertas no firewall
3. Use o [IP Changer](https://github.com/rodalb/Clientes-LC) para configurar o cliente

## 🔗 Links Relacionados

- **Cliente Windows:** [Clientes-LC](https://github.com/rodalb/Clientes-LC)
- **Código Fonte Original:** [openlastchaos](https://github.com/openlastchaos)
- **Desenvolvedor Original:** [tx00100xt](https://github.com/tx00100xt)

## 📝 Estrutura do Repositório

```
Servers-LC/
├── LC2015/                    # Episode 4 (2015)
│   ├── Server.x64/           # Binários do servidor
│   ├── Database/             # SQL dumps
│   ├── Scripts/              # Scripts de instalação
│   └── docs/                 # Documentação
├── LC2018/                    # Episode 7 (2018)
│   ├── Server.x64/
│   ├── Database/
│   ├── Scripts/
│   └── docs/
└── README.md
```

## 🤝 Contribuindo

Contribuições são bem-vindas! Por favor:

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/NovaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona NovaFeature'`)
4. Push para a branch (`git push origin feature/NovaFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença GPL-3.0. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👤 Autor

**rodalb**
- GitHub: [@rodalb](https://github.com/rodalb)

## 🙏 Créditos

- **Código Fonte Original:** [openlastchaos](https://github.com/openlastchaos)
- **Desenvolvedor:** [tx00100xt](https://github.com/tx00100xt) (Alexander Pavlov)
- **Comunidade Last Chaos**

## ⚠️ Aviso Legal

Este projeto é apenas para fins educacionais e de preservação. Last Chaos é propriedade de seus respectivos donos.

---

**Status:** ✅ Funcionando | **Última Atualização:** Fevereiro 2026
>>>>>>> b02abb0 (Initial commit: Last Chaos Server Episode 4 & 7)
