# API de mineração de texto
API para mineração de texto de sites, em geral.</br>
Com apenas do link do site a api extrai as palavras mais frequentes do site e as exibe em ordem decrescente.</br>
Como instalar: 
Instale o Docker e o git.
Pela linha de comando faça: </br>
git clone https://github.com/danttis/API-Mineracao-de-Texto </br>
cd API-Mineracao-de-Texto </br>
docker build -t api-mining . </br>
docker run --name digite o nome que desejar -d -p 8080:8080 api-mining
</br>
Exemplo de uso: </br>
curl http://127.0.0.1:8080/minerar?link=site.exemplo.com&qtd=Quantidade de palavras que deseja obter</br>

