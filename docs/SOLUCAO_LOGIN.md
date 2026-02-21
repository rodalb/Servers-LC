# Solução do Problema de Login - Last Chaos Server

## Problema Identificado

O servidor Last Chaos usa **DUAS tabelas** para autenticação:

1. **`bg_user`** - Tabela principal de autenticação (verifica usuário/senha)
2. **`t_users`** - Tabela de dados do usuário no jogo (criada automaticamente no primeiro login)

### Erro Anterior
Estávamos tentando criar contas na tabela `t_account` (que não existe no sistema original) e na `t_users` (que é secundária).

## Estrutura Correta

### Tabela `bg_user` (ep4_db_auth)
```sql
CREATE TABLE bg_user (
  user_code INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(30) NOT NULL UNIQUE,
  passwd VARCHAR(50) NOT NULL,
  activated INT NOT NULL DEFAULT 0,
  chk_service CHAR(1) DEFAULT 'Y',
  partner_id CHAR(2) DEFAULT 'LC',
  create_date DATETIME,
  ...
);
```

### Contas Disponíveis

| Usuário | Senha    | Status |
|---------|----------|--------|
| root    | root     | ✓ Ativo |
| noob    | noob     | ✓ Ativo |
| odisey  | odisey   | ✓ Ativo |
| admin   | admin123 | ✓ Ativo |

## Como o Login Funciona

1. Cliente envia `user_id` e `passwd` para LoginServer (porta 4001)
2. LoginServer consulta `bg_user`:
   ```sql
   SELECT user_code, user_id, passwd, activated 
   FROM bg_user 
   WHERE user_id='admin'
   ```
3. Compara senha em **TEXTO PLANO** (não é MD5!)
4. Verifica se `activated = 1`
5. Consulta `t_users` para dados do jogo:
   ```sql
   SELECT a_enable, a_server_num, a_zone_num 
   FROM t_users 
   WHERE a_portal_index=user_code
   ```
6. Se não existir em `t_users`, cria automaticamente no primeiro login

## Código de Autenticação

Arquivo: `LoginServer/Descriptor.cpp` (linha 83-400)

```cpp
// Busca usuário no bg_user
buf.Format("SELECT user_code, user_id, passwd, activated FROM bg_user WHERE user_id='%s'", m_idname);

// Verifica se está ativado
if(bActivated == 0) {
    throw MSG_FAIL_LOGINSERV_WRONG_PASSWORD;
}

// Compara senha em texto plano
if(pass.compare(dbpass) != 0) {
    throw MSG_FAIL_LOGINSERV_WRONG_PASSWORD;
}

// Busca dados em t_users
sql.Format("SELECT a_enable FROM t_users WHERE a_portal_index=%d", usercode);
```

## Como Criar Nova Conta

```sql
INSERT INTO bg_user (user_id, passwd, activated, chk_service, partner_id, create_date, update_time) 
VALUES ('novouser', 'senha123', 1, 'Y', 'LC', NOW(), NOW());
```

**Importante:**
- `activated` deve ser `1` (ativo)
- `chk_service` deve ser `'Y'`
- `partner_id` deve ser `'LC'`
- Senha é armazenada em **texto plano**
- Entrada em `t_users` é criada automaticamente no primeiro login

## Teste de Login

Agora você pode testar com qualquer uma dessas contas:
- **admin / admin123** ← Nova conta criada
- **root / root** ← Conta padrão
- **noob / noob** ← Conta padrão
- **odisey / odisey** ← Conta padrão

## Erros Comuns

### Erro: "Account ID is in use" ou "ALREADY CONNECT"

**Causa:** O servidor mantém a sessão ativa em `t_users` mesmo após desconexão.

**Solução:**
```bash
# Limpar todas as sessões ativas
bash /home/LCServer/LCS2015/limpar_sessoes.sh

# OU manualmente:
mysql -uroot -plastchaos123 ep4_db_auth -e "UPDATE t_users SET a_server_num=-1, a_zone_num=-1 WHERE a_idname='admin';"
```

### Erro 24: "CONNECTOR SYSTEM error"

**Causa:** Problema de comunicação entre GameServer e Connector.

**Solução:**
1. Verificar se todos os servidores estão rodando:
   ```bash
   ps aux | grep -E "Connector|LoginServer|GameServer"
   ```

2. Reiniciar os servidores se necessário:
   ```bash
   bash /home/LCServer/LCS2015/run-server.sh restart
   ```

### Billing Server Error (Porta 8888)

**Não é crítico** - O servidor tenta conectar ao billing server (sistema de pagamento), mas funciona sem ele.

## Logs do Servidor

Para verificar tentativas de login:
```bash
# Login Server
tail -f /home/LCServer/LCS2015/Server.x64/LogFiles/Login.log

# Game Server
tail -f /home/LCServer/LCS2015/Server.x64/LogFiles/Gameserver_1_1.log

# Connector
tail -f /home/LCServer/LCS2015/Server.x64/LogFiles/Connector_1.log
```

Mensagens esperadas:
- `LOGIN OK / id[admin]` ← Login bem-sucedido no LoginServer
- `LOGIN REQ > admin` ← Requisição recebida no GameServer
- `CONN_ERR > admin : ALREADY CONNECT` ← Conta já está conectada (limpar sessão)
- `CONN_ERR > admin : CONNECTOR SYSTEM error` ← Erro no Connector (reiniciar)
