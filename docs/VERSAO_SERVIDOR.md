# Versão do Servidor Last Chaos

## 🎮 Episódio: Episode 4 (2015)

### Informações da Versão

**Servidor:** Last Chaos Server 2015 (LCS2015)  
**Episódio:** Episode 4  
**Arquitetura:** 64-bit  
**Sistema Operacional:** Linux (Ubuntu/Debian)  
**Versão do Cliente:** 700 (compatível)

### Bancos de Dados

O servidor usa 4 bancos de dados do Episode 4:

1. **ep4_data** - Dados do jogo (itens, monstros, NPCs, mapas)
2. **ep4_db** - Dados dos personagens (inventário, skills, quests)
3. **ep4_db_auth** - Autenticação (contas, usuários, login)
4. **ep4_post** - Sistema de correio (mensagens entre jogadores)

### Características do Episode 4

#### Conteúdo do Jogo
- ✅ Level máximo: 400
- ✅ Mapas: Dratan, Merac, Juno, Uruga
- ✅ Classes: Titan, Knight, Healer, Mage, Rogue, Sorcerer
- ✅ Sistema de Pets
- ✅ Sistema de Montarias
- ✅ Sistema de Guildas
- ✅ Sistema de Party
- ✅ PvP e GvG
- ✅ Dungeons e Raids
- ✅ Sistema de Craft
- ✅ Sistema de Upgrade (+0 a +20)
- ✅ Sistema de Chaos Combination

#### Recursos Técnicos
- ✅ DirectX 9 (cliente)
- ✅ Servidor 64-bit
- ✅ Suporte para múltiplos canais
- ✅ Sistema de billing (opcional)
- ✅ Sistema anti-hack
- ✅ Log4j para logging
- ✅ MySQL 5.7+

### Versões Disponíveis

Você tem acesso a DUAS versões no código fonte:

#### 1. LC2015 (Episode 4) ← ATUAL
- **Localização:** `/home/LCServer/LCS2015/`
- **Status:** ✅ Rodando
- **Databases:** ep4_data, ep4_db, ep4_db_auth, ep4_post
- **Estabilidade:** Alta (mais testada)
- **Recomendado para:** Produção

#### 2. LC2018 (November 2018) - Episode 7
- **Localização:** `/home/LCServer/LCS2018/`
- **Status:** Disponível (não iniciado)
- **Episódio:** Episode 7 (estimado)
- **Databases:** 2018_nov_data, 2018_nov_db, 2018_nov_db_auth, 2018_nov_post
- **Estabilidade:** Boa (mais recente)
- **Recomendado para:** Testes de features novas

### Comparação: Episode 4 (2015) vs Episode 7 (November 2018)

| Característica | Episode 4 (2015) | Episode 7 (Nov 2018) |
|----------------|------------------|----------------------|
| Episódio | Episode 4 | Episode 7 (estimado) |
| Level Máximo | 400 | 450+ |
| Mapas | Dratan, Merac, Juno, Uruga | + Novos mapas (Eres, etc) |
| Classes | 6 classes | 6 classes + melhorias |
| Skills | Sistema base | Sistema expandido |
| Itens | Conjunto base | + Novos itens e sets |
| Dungeons | Dungeons base | + Novos dungeons |
| Estabilidade | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Documentação | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Comunidade | Grande | Média |

### Cliente Compatível

**Versão do Cliente:** 700  
**Localização no Windows:** `C:\LastChaos\Client\`  
**Executável:** `Nksp.exe`

#### Requisitos do Cliente
- Windows 7/8/10/11 (64-bit)
- DirectX 9.0c
- Visual C++ Redistributable 2015-2022
- 2GB RAM mínimo
- Placa de vídeo com suporte DirectX 9

### Arquivos de Configuração

#### Servidor
```
/home/LCServer/LCS2015/Server.x64/
├── Messenger/config.txt
├── Helper/config.txt
├── SubHelper/config.txt
├── Connector/config.txt
├── LoginServer/config.txt
└── GameServer/config.txt
```

#### Cliente (Windows)
```
C:\LastChaos\Client\
├── sl.dta          # Configuração do servidor (IP criptografado)
├── lccnct.dta      # Configuração de conexão
└── option.ini      # Opções do jogo
```

### Portas Utilizadas

| Servidor | Porta | Protocolo | Descrição |
|----------|-------|-----------|-----------|
| Messenger | 4112 | TCP | Comunicação entre servidores |
| Helper | 3000 | TCP | Sistema de ajuda |
| SubHelper | 50401 | TCP | Helper secundário |
| Connector | 4006 | TCP | Conexão entre Login e Game |
| LoginServer | 4001 | TCP | Login de jogadores |
| GameServer | 4101 | TCP | Jogo principal |
| Billing (opcional) | 8888 | TCP | Sistema de pagamento |

### Como Mudar para LC2018

Se quiser testar a versão November 2018:

```bash
# 1. Parar servidor atual
bash /home/LCServer/LCS2015/run-server.sh stop

# 2. Criar bancos de dados 2018
mysql -uroot -plastchaos123 << 'EOF'
CREATE DATABASE 2018_nov_data;
CREATE DATABASE 2018_nov_db;
CREATE DATABASE 2018_nov_db_auth;
CREATE DATABASE 2018_nov_post;
EOF

# 3. Importar dados
cd /home/LCSources/VSProjects/LC2018/DB
mysql -uroot -plastchaos123 2018_nov_data < 2018_nov_data.sql
mysql -uroot -plastchaos123 2018_nov_db < 2018_nov_db.sql
mysql -uroot -plastchaos123 2018_nov_db_auth < 2018_nov_db_auth.sql
mysql -uroot -plastchaos123 2018_nov_post < 2018_nov_post.sql

# 4. Iniciar servidor 2018
bash /home/LCServer/LCS2018/run-server.sh start
```

### Histórico de Episódios Last Chaos

Para referência, aqui está a linha do tempo dos episódios:

1. **Episode 1** (2006) - Lançamento original
2. **Episode 2** (2007) - Juno
3. **Episode 3** (2008) - Uruga
4. **Episode 4** (2009-2015) ← VOCÊ ESTÁ AQUI
5. **Episode 5** (2016) - Iris
6. **Episode 6** (2017) - Eres
7. **Episode 7** (2018) - November 2018 ← DISPONÍVEL
8. **Episode 8+** (2019+) - Versões mais recentes

**Nota:** A versão November 2018 é provavelmente Episode 7 ou uma versão intermediária entre Episode 6 e 7, baseada na data de lançamento e estrutura dos arquivos.

### Conclusão

Você está rodando o **Last Chaos Episode 4 (2015)**, que é:
- ✅ Versão estável e bem testada
- ✅ Ótima para servidor de produção
- ✅ Grande comunidade e suporte
- ✅ Cliente 64-bit com DirectX 9
- ✅ Servidor 64-bit otimizado

Se quiser experimentar features mais novas, você pode facilmente mudar para a versão November 2018 que também está disponível!

---

**Servidor Atual:** Episode 4 (2015)  
**Status:** ✅ Online e funcionando  
**Versão Alternativa:** November 2018 (disponível)
