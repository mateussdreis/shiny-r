library(shiny)

# define tudo que é visível ao usuário 
ui <- fluidPage(
  #fluidPage: adaptável a qualquer página
  
  # Application title
  titlePanel("Aula sobre estruturação"),
  
  #sidebarlayout cria o layout da página
  sidebarLayout(
    # sidebarPanel campos de entrada e botões
    sidebarPanel(h2("Nessa area ficaro os dados de input")
    ), #h tamanho dos textos
    
    mainPanel(
      h2("Aqui serao os elementos de saída de dados")
    ),
  )
)

#Backend do painel: input-entradas de dados, output-saída de dados
server <- function(input, output) {
  
}

# Run the application 
shinyApp(ui = ui, server = server)