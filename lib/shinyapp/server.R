load("oscars_summary.RData")

shinyServer(function(input, output) {
  str<-reactive({input$inputOscar})
  genre<-reactive({input$inputGenre})
  change<-reactive({a<-input$inputOscar;b<-input$inputGenre;isolate(input$click)})
  
  clicks<-reactive({input$click-change()})
  
  outmovie<-reactive({
    root<-movie[which(movie$Name==str()),]$index
    
    data<-filter(movie,Type==genre()) %>%
           filter(Name!=str()) 
    
    target<-data$index
    recommend<-target[order(distance_matrix[root,target])]
    
    indice<-clicks()+1
    movie[recommend[indice],]
  })
  
  output$rec<-renderValueBox({
    valueBox(outmovie()$Name,outmovie()$Type,color = "green")
    
  }) 
  output$twitter<-renderValueBox({
    valueBox(outmovie()$Twitter,"Twitter Rate: 0-10")
    
  }) 
  output$tomato<-renderValueBox({
    valueBox(outmovie()$Tomato,"Rotten Tomato Rate: 0-10",color="red")
  })
  
  output$poster<-renderImage({jj<-paste(outmovie()$Asin,"jpg",sep=".");
                  list(src = jj,alt = "Image failed to render",width=400,height=600,style="display: block; margin-left: auto; margin-right: auto;")
  }, deleteFile = FALSE)
  
})