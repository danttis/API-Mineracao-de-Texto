# API de mineração de texto
API para mineração de texto de sites, em geral.</br>
Com apenas do link do site a api extrai as 100 palavras mais frequentes do site e as exibe em ordem decrescente.</br>
Necessidade de servidor R ou servidor fisico. </br>
Exemplo de uso: </br>
curl http://127.0.0.1:8080/minerar?link=site.exemplo.com </br>
curl -X GET "http://127.0.0.1:8080/minerar?link=site.exemplo.com"
