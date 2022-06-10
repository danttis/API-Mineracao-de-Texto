library(plumber)
library(tm)
library(textreadr)

#* @apiTitle MineraçãoDeTexo

#Essa API raspa um site desejado e retorna as 100 palavras que mais se repetem no site, 
#excluido as stopwords, ou seja, palavras sem muito valor e preposições, 
#o uso é muito simples basta apenas colocar o link do site desejado depois de /raspagem?link=



#* Raspagem de Site
#* @param link
#* @get /minerar
function(link) {
  k = read_html(link) #Extração do conteúdo do site desejado
  
  x = VCorpus(VectorSource(k), readerControl = list(readPlain, language = "pt"))#Transformado os dados em um corpus
  
  x = tm_map(x, removeWords, c(stopwords("english"),stopwords("portuguese")))#Removendo os stopwords, ou seja, palavras sem muito valor e preposições.
  
  x = tm_map(x, removePunctuation)#Removendo pontuação
  
  x = tm_map(x, removeNumbers)#Removendo números
  
  x = tm_map(x, stripWhitespace) #Removendo espaços em branco
  
 
  freq = TermDocumentMatrix(x) #Transformando nosso corpo em uma matriz
  
  matriz = as.matrix(freq) #Criando frequência das palavras
  
  matriz = sort(rowSums(matriz), decreasing = T) #Ordenando por quantidade de repetição em ordem decrescente.
  
  
  matriz = data.frame(word=names(matriz), freq=matriz) #Transformando nossa matriz em uma data frame
  
  head(matriz, n=100)# Exibindo as palavras que mais se repetem.
}

