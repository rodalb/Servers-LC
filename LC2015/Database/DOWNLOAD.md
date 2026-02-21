# Bancos de Dados LC2015

Os arquivos SQL são muito grandes para o GitHub.

## Download:

Baixe os bancos de dados em:
https://github.com/rodalb/Servers-LC/releases/latest

Arquivos necessários:
- ep4_data.sql (52 MB)
- ep4_db.sql (150 KB)
- ep4_db_auth.sql (30 KB)
- ep4_post.sql (40 KB)

## Importar:

```bash
mysql -uroot -p ep4_data < ep4_data.sql
mysql -uroot -p ep4_db < ep4_db.sql
mysql -uroot -p ep4_db_auth < ep4_db_auth.sql
mysql -uroot -p ep4_post < ep4_post.sql
```
