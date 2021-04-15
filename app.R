library(shiny)

# define tudo que é visível ao usuário 
ui <- fluidPage(
  #fluidPage: adaptável a qualquer página
  
  # Application title
  titlePanel("Entrada e saída de dados"),
  
  #sidebarlayout cria o layout da página
  sidebarLayout(
    # sidebarPanel campos de entrada e botões
    sidebarPanel(h2("Entrada de dados"),#Nessa area ficaro os dados de input
                 tags$img(src="logoR.png", height=100, width=100), #atente-se para a necessidade da pasta www e a duplicata da imagem
                 textInput("idEntradaTexto","Informe um texto"),#entrada de strings
                 numericInput("idEntradaNumerica","Informe um número", 0, min = 0, max = 100, step = 5),
                 dateInput("idData","Informe a Data",format = "dd-mm-yyyy", language = "pt", autoclose = T),
                 radioButtons("idRadio","Selecione seu sexo", choices = c("M","F"), inline = T),#radio buton
                 radioButtons("idRadio1","Selecione seu sexo", list("Opcao 1"=1,"Opcao 2"=2,"Opcao 3"=3),selected = 1, inline = F)#radio buton
    ), #h tamanho dos textos
    
    mainPanel(
      h2("Saída de dados"), #Aqui serao os elementos de saída de dados
      textOutput("idSaidaTexto"),
      verbatimTextOutput("idSaidaNumerica",placeholder = TRUE),#para dados numéricos!
      verbatimTextOutput("idSaidaData"),
      verbatimTextOutput("idOpcaoSelecionada"),
      verbatimTextOutput("idOpcaoSelecionada1")
    ),
  )
)

#Backend do painel: input-entradas de dados, output-saída de dados
server <- function(input, output) {
  output$idSaidaTexto<-renderText({input$idEntradaTexto})
  output$idSaidaNumerica<-renderText({input$idEntradaNumerica})
  #saída recebe o output e o identificador da saída, renderText serve para atualizar automaticamente a saída
  output$idSaidaData<-renderText({as.character(input$idData)})
  output$idOpcaoSelecionada<-renderText({input$idRadio})
  output$idOpcaoSelecionada1<-renderText({input$idRadio1})
  }

# Run the application 
shinyApp(ui = ui, server = server)