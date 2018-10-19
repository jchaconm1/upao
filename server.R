
# Reading data set
my_data = data.frame(Sujeto = rep(paste0("P", 1:3),2),
                     Rutina = rep(paste0(1:3), 2),
                     Tipo = rep(c('Control', 'ProblemaCardio', 'ProblemaCardio'),2))


tmpPa <- data.frame(Paciente = rep('Paciente', 300),
                    Rutina = cos(1:75), 
                    Tiempo = 1:75)


server <- function(input, output) {

  ## stuffs for data tab
  # data table output
  output$da.tab <- DT::renderDataTable(datatable(my_data, extensions = 'Buttons',
                                                 style = "bootstrap",
                                                 filter = list(position = 'top', clear = T, plain = F),
                                                 options = list(pageLength = 1500, dom = 'Bfrtip', 
                                                                buttons = 
                                                                  list('copy', 'print', list(
                                                                    extend = 'collection',
                                                                    buttons = c('csv', 'excel', 'pdf'), 
                                                                    text = 'Download')
                                                                  )
                                                 )
  )
  )
  ## stuffs for data explorer
  # for tab: Killed

  
  output$PltP1 <- renderPlotly({
    p1 <- ggplot(tmpPa, aes(Tiempo, Rutina)) + geom_line() + 
      ggthemes::theme_gdocs()
    
    ggplotly(p1)
  })
  
  output$PltP2 <- renderPlotly({
    p2 <- ggplot(tmpPa, aes(Tiempo, 0.39*Rutina)) + geom_line() + 
      ggthemes::theme_gdocs()
    
    ggplotly(p2)
  })
  
  output$PltP3 <- renderPlotly({
    p3 <- ggplot(tmpPa, aes(Tiempo, 0.5*(Rutina + 0.5) )) + geom_line() + 
      ggthemes::theme_gdocs()
    
    ggplotly(p3)
  })
  
}

