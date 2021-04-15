library(shiny)

# define tudo que é visível ao usuário 
ui <- fluidPage(
  #fluidPage: adaptável a qualquer página
  
  # Application title
  titlePanel("Entrada e saída de dados"),
  
  #sidebarlayout cria o layout da página
  sidebarLayout(
    # sidebarPanel campos de entrada e botões
    sidebarPanel(h2("Nessa area ficaro os dados de input"),
                 textInput("idEntradaTexto","Informe um texto"),#entrada de strings
                 numericInput("idEntradaNumerica","Informe um número", 0, min = 0, max = 100, step = 5)
    ), #h tamanho dos textos
    
    mainPanel(
      h2("Aqui serao os elementos de saída de dados"),
      textOutput("idSaidaTexto"),
      verbatimTextOutput("idSaidaNumerica",placeholder = TRUE)#para dados numéricos!
    ),
  )
)

#Backend do painel: input-entradas de dados, output-saída de dados
server <- function(input, output) {
  output$idSaidaTexto<-renderText({input$idEntradaTexto})
  output$idSaidaNumerica<-renderText({input$idEntradaNumerica})
  #saída recebe o output e o identificador da saída, renderText serve para atualizar automaticamente a saída
}

# Run the application 
shinyApp(ui = ui, server = server)