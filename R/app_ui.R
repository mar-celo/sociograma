#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @import visNetwork
#' @import bs4Dash
#' @noRd
app_ui <- function(request) {
  library(shinydashboard)
  library(visNetwork)
  library(bs4Dash)
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    shinydashboard::dashboardPage(
                                  shinydashboard::dashboardHeader(title = "Exemplo"),
                                  shinydashboard::dashboardSidebar(
                                    shinydashboard::sidebarMenu(
                                      shinydashboard::menuItem("Informações gerais", tabName = "info")
                                    )
                                  ),
                                  shinydashboard::dashboardBody(
                                    dashboardthemes::shinyDashboardThemes(
                                      theme = "grey_light"
                                    ),
                                    tabItems(
                                      tabItem(
                                        tabName = "info",
                                        fluidRow(
                                          column(
                                            width = 12,
                                            h1("Informações da Rede")
                                          )
                                        ),
                                        # hr(style = "border-top: 1px solid black;"),
                                        br(),
                                        fluidRow(
                                          visNetworkOutput("network",
                                                           width = "100%",
                                                           height = "800px")
                                        )
                                      )
                                    )
                                  )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "sociograma"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
