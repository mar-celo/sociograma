#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
    
    output$network <- renderVisNetwork({
      
      

      visNetwork(nodes, edges) %>%
        visIgraphLayout() %>% 
        visOptions(selectedBy = "group", 
                   highlightNearest = TRUE, 
                   nodesIdSelection = TRUE) %>%
        visPhysics(stabilization = FALSE)
    })
}
