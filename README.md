# API de Mineração de Texto

API para mineração de texto de sites em geral. Com apenas o link do site, a API extrai as palavras mais frequentes do site e as exibe em ordem decrescente.

## Como instalar

Certifique-se de ter o Docker e o git instalados. Em seguida, execute os seguintes comandos no terminal:

```bash
git clone https://github.com/danttis/API-Mineracao-de-Texto
cd API-Mineracao-de-Texto
docker build -t api-mining .
docker run --name <nome-desejado> -d -p 8080:8080 api-mining
```

Substitua `<nome-desejado>` pelo nome que você deseja dar ao contêiner.

## Exemplo de uso

Para extrair as palavras mais frequentes de um site, use o seguinte exemplo de comando curl:

```bash
curl http://127.0.0.1:8080/minerar?link=site.exemplo.com&qtd=<quantidade-de-palavras>
```

Substitua `site.exemplo.com` pelo site desejado e `<quantidade-de-palavras>` pela quantidade de palavras que você deseja obter.
