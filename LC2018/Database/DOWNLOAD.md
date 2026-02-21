# Bancos de Dados LC2018

Os arquivos SQL são muito grandes para o GitHub.

## Download:

Baixe os bancos de dados em:
https://github.com/rodalb/Servers-LC/releases/latest

Arquivos necessários:
- 2018_nov_data.sql (52 MB)
- 2018_nov_db.sql (150 KB)
- 2018_nov_db_auth.sql (30 KB)
- 2018_nov_post.sql (40 KB)

## Importar:

```bash
mysql -uroot -p 2018_nov_data < 2018_nov_data.sql
mysql -uroot -p 2018_nov_db < 2018_nov_db.sql
mysql -uroot -p 2018_nov_db_auth < 2018_nov_db_auth.sql
mysql -uroot -p 2018_nov_post < 2018_nov_post.sql
```
