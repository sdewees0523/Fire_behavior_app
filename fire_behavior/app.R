library(shiny)
library(tidyverse)
library(sf)
library(raster)

# Create the user interface
ui <- fluidPage(
    titlePanel("Creating Flammap inputs from satellite data"),
    sidebarLayout(
        sidebarPanel(dateRangeInput(inputId = "data_date",
                                    label = "Choose date range for data:"),
        sidebarPanel("",
                     checkboxGroupInput(inputId = "satellites",
                                        label = "Choose your satellites for data:",
                                        choices = c("Landsat", "Sentinel", 
                                                    "Avarris"))
        )
        ),
        mainPanel("Map of satellite data")
        
    )
)

# Create the server function
server <- function(input, output) {}

# Combine into an app
shinyApp(ui = ui, server = server)