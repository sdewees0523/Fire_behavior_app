library(shiny)
library(tidyverse)
library(sf)
library(raster)
library(shinythemes)

# Create the user interface
ui <- fluidPage(
    theme = shinytheme("superhero"),
    
    navbarPage("Creating Flammap inputs from satellite data",
               tabPanel("Introduction",
                        p("The purpose of this app is to merge remote sensing and fire
                 behavior modeling, in an easy to use interface. The end product of 
                 this app is to create a landscape file ready for input into Flammap. The 
                 goal however is to do this soley from freely available spectra satellite
                 data, not labor intensive field data. Therefore, the wide spectra that the
                 Avarris satellite provides is ideal, but full spatial coverage isn't
                 always available. Thus, an initial step is to compile Avarris data were
                 available, create the vegetation indexes that might be useful for creating
                 the landscape file, and then use a trained random forest model to predict
                 those idexes with the more widely available Landsat and Sentinel datasets.")),
               tabPanel("Choosing date range and satellite data",
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
                            
                        )),
               tabPanel("Selecting vegetation indexes",
                        sidebarPanel("",
                                     checkboxGroupInput(inputId =  "vegetation_indexes",
                                                        label = "Choose vegetation indexes to calculate",
                                                        choices = c("CAI", "NPV", "GI",
                                                                    "bare_soil"))
                        ),
                        mainPanel("Map of vegetation indexes")
                        
               ),
               tabPanel("Selecting other required inputs",
                        sidebarPanel("",
                                     checkboxGroupInput(inputId = "required_inputs",
                                                        label = "Choose required inputs:",
                                                        choices = c("DEM_10m", "DEM_20m", "DEM_30m",
                                                                    "generic_fuel_model", "custom_fuel_model",
                                                                    "canopy_cover_10m", "canopy_cover_20m",
                                                                    "canopy_cover_30m"))
                        ),
                        mainPanel("Map of required inputs")
               ),
               tabPanel("Selecting optional inputs",
                        "",
                        fileInput(inputId = "optional_data",
                                  label = "Import extra data for optional inputs (e.g. LIDAR):",
                                  multiple = TRUE),
                        checkboxGroupInput(inputId = "optional_inputs",
                                           label = "Choose optional inputs to include:",
                                           choices = c("stand_height", "canopy_bulk_density", 
                                                       "canopy_base_height")))
               
    )
    
)

# Create the server function
server <- function(input, output) {}

# Combine into an app
shinyApp(ui = ui, server = server)