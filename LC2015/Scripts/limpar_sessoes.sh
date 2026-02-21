#!/bin/bash
# Script para limpar sessões ativas no Last Chaos Server

echo "Limpando todas as sessões ativas..."

mysql -uroot -plastchaos123 ep4_db_auth << 'EOF'
UPDATE t_users SET a_server_num=-1, a_zone_num=-1, a_end_date=NOW() WHERE a_server_num != -1;
SELECT COUNT(*) as sessoes_limpas FROM t_users WHERE a_server_num = -1;
EOF

echo ""
echo "Sessões limpas com sucesso!"
echo "Agora você pode fazer login normalmente."
