
# Define server logic for random distribution app ----
server <- function(input, output) {
    juteData <- read.csv("Data.csv", header = TRUE)
    
    resultWD1 <- subset(juteData, 
                        juteData$WEIGHT.OF.THE.BALE..kg. == 180)
    resultWD2 <- subset(juteData, juteData$WEIGHT.OF.THE.BALE..kg. > 130 & juteData$WEIGHT.OF.THE.BALE..kg. < 170)
    resultWD3 <- subset(juteData, juteData$WEIGHT.OF.THE.BALE..kg. > 80 & juteData$WEIGHT.OF.THE.BALE..kg. < 120)  
    
    WD1Count=nrow(resultWD1)
    WD2Count=nrow(resultWD2)
    WD3Count=nrow(resultWD3)
    
    output$juteData <- renderTable({
      juteData
    })
    
    output$resultWD1 <- renderTable({
      resultWD2
    })
    
    output$resultWD2 <- renderTable({
      resultWD2
    })
    
    output$resultWD3 <- renderTable({
      resultWD3
    })
    
    output$pieChart <- renderPlot({
      graphData <- c(WD1Count,WD2Count, WD3Count)
      pie(graphData, labels = c("WD1","WD2","WD3"),main = "Graphical Result",col = c("green","red","black")) 
    })
   
}
