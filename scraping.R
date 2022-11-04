library(plumber)
library(tm)
library(textreadr)

#* @apiTitle Text Mining

#* @apiDescription  This API mines a desired site and returns the 100 words that are most repeated on the site, excluding stopwords, that is, words without much semantic value, use is quite simple, just put the link to the desired site after /mining?link=

#* Site Scraping
#* @get /mining
function(link, qtd) {
  k = read_html(link) #Extração do conteúdo do site desejado
  
  x = VCorpus(VectorSource(k), readerControl = list(readPlain, language = "pt"))#Transformado os dados em um corpus
  
  x = tm_map(x, removeWords, c(stopwords("english"),stopwords("portuguese"),stopwords("spanish")))#Removendo os stopwords, ou seja, palavras sem muito valor e preposições.
  
  x = tm_map(x, removePunctuation)#Removendo pontuação
  
  x = tm_map(x, removeNumbers)#Removendo números
  
  x = tm_map(x, stripWhitespace) #Removendo espaços em branco
  
 
  freq = TermDocumentMatrix(x) #Transformando nosso corpo em uma Matrix
  
  Matrix = as.matrix(freq) #Criando frequência das palavras
  
  Matrix = sort(rowSums(Matrix), decreasing = T) #Ordenando por quantidade de repetição em ordem decrescente.
  
  Matrix = data.frame(word=names(Matrix), freq=Matrix) #Transformando nossa Matrix em uma data frame
  
  head(Matrix, n=qtd)# Exibindo as palavras que mais se repetem.
}

