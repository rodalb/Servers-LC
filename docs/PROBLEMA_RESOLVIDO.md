# Problema de Login Resolvido - Last Chaos Server

## Problemas Encontrados e Soluções

### 1. Tabela Errada para Autenticação
**Problema:** Tentando criar contas em `t_account` (não existe) ou `t_users` (secundária)  
**Solução:** O servidor usa `bg_user` para autenticação

### 2. Erro "Account ID is in use" / "ALREADY CONNECT"
**Problema:** Sessão ativa em `t_users` não foi limpa após desconexão  
**Solução:** Limpar sessões com:
```bash
bash /home/LCServer/LCS2015/limpar_sessoes.sh
```

### 3. Erro "CONNECTOR SYSTEM error"
**Problema:** Connector não estava rodando  
**Solução:** Iniciar o Connector:
```bash
cd /home/LCServer/LCS2015/Server.x64/Connector
./Connector > ../LogFiles/Connector_manual.log 2>&1 &
```

## Status Atual

### Servidores Rodando ✓
- Messenger (PID 70201) - Porta 4112
- Helper (PID 70223) - Porta 3000
- SubHelper (PID 70249) - Porta 50401
- Connector (PID 84668) - Porta 4006
- LoginServer (PID 70305) - Porta 4001
- GameServer (PID 70314) - Porta 4101

### Contas Disponíveis ✓
| Usuário | Senha    | Status |
|---------|----------|--------|
| admin   | admin123 | ✓ Pronto |
| root    | root     | ✓ Pronto |
| noob    | noob     | ✓ Pronto |
| odisey  | odisey   | ✓ Pronto |

### Sessões Limpas ✓
Todas as contas estão com `a_server_num=-1` e `a_zone_num=-1` (disponíveis para login)

## Como Testar

1. **Abra o cliente Last Chaos** no Windows (`C:\LastChaos\Client\Bin\Nksp.exe`)

2. **Configure o servidor:**
   - IP: `172.21.90.106` (já configurado no `sl.dta`)
   - Porta: `4001`

3. **Faça login com qualquer conta:**
   - admin / admin123
   - root / root
   - noob / noob
   - odisey / odisey

4. **Se der erro "Account in use":**
   ```bash
   bash /home/LCServer/LCS2015/limpar_sessoes.sh
   ```

## Comandos Úteis

### Verificar Status dos Servidores
```bash
ps aux | grep -E "Messenger|Helper|SubHelper|Connector|LoginServer|GameServer" | grep -v grep
```

### Ver Logs em Tempo Real
```bash
# Login
tail -f /home/LCServer/LCS2015/Server.x64/LogFiles/Login.log

# Game
tail -f /home/LCServer/LCS2015/Server.x64/LogFiles/Gameserver_1_1.log

# Connector
tail -f /home/LCServer/LCS2015/Server.x64/LogFiles/Connector_manual.log
```

### Limpar Sessões Ativas
```bash
bash /home/LCServer/LCS2015/limpar_sessoes.sh
```

### Reiniciar Connector (se necessário)
```bash
pkill Connector
cd /home/LCServer/LCS2015/Server.x64/Connector
./Connector > ../LogFiles/Connector_manual.log 2>&1 &
```

## Próximos Passos

1. ✓ Login funcionando
2. ✓ Todos os servidores rodando
3. ✓ Sessões limpas
4. → Testar criação de personagem no jogo
5. → Testar gameplay básico

## Notas Importantes

- **Senhas em texto plano:** O servidor armazena senhas sem criptografia em `bg_user.passwd`
- **Billing server:** Erro na porta 8888 é normal (sistema de pagamento opcional)
- **Primeira conexão:** O servidor cria automaticamente a entrada em `t_users` no primeiro login
- **Desconexão:** Sempre use logout correto no jogo para evitar sessões travadas
