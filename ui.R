library(shinydashboard)
#library(ShinyDash)

# addResourcePath(
#   prefix = 'shinyDash',
#   directoryPath = system.file('shinyDash', package='ShinyDash'))

dashboardPage(skin = "yellow",
  dashboardHeader(title = "HIDAP",
                  dropdownMenu(type = "tasks", badgeStatus = "success",
                               taskItem(value = 66, color = "yellow", "PTYL"
                               ),
                               taskItem(value = 66, color = "yellow", "PTLB"
                               ),
                               taskItem(value = 66, color = "yellow", "PTDT"
                               ),
                               taskItem(value = 20, color = "red", "TMIN"
                               ),
                               taskItem(value = 20, color = "red", "TVIT"
                               ),
                               taskItem(value = 20, color = "red", "PTPV"
                               ),
                               taskItem(value = 66, color = "yellow", "PTBM"
                               ),
                               taskItem(value = 66, color = "yellow", "PTDS"
                               ),
                               taskItem(value = 66, color = "yellow", "SPYL"
                               ),
                               taskItem(value = 33, color = "red", "SPMF"
                               )
                  ),
                  
                  dropdownMenu(type = "notifications",
                               notificationItem(text = "It has 10 experimental designs online",
                                                icon("cube")
                               )
                  )
  ),
  dashboardSidebar(
    div(style="margin-right: auto;",img(src = "Logo1.png", width = "230")),
    sidebarSearchForm(label = "Enter a word", "searchText", "searchButton"),
    sidebarMenu(
      id = "tabs",
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"), badgeLabel = "new", badgeColor = "green"),
      menuItem("Phenotype tool", icon = icon("th-list"),
               menuSubItem("New fieldbook", tabName = "newFieldbook"),
               menuSubItem("Check fieldbook", tabName = "checkFieldbook"),
               menuSubItem("Analysis", tabName = "analysis")
      ),
      menuItem("Genotype tool", icon = icon("th"),
               menuSubItem("Cross marker", tabName = "crossMarker")
      ),
      menuItem("Environment", tabName = "environment", icon = icon("spinner")),
      menuItem("Integration", tabName = "integration", icon = icon("bar-chart")),
      menuItem("Supporting info", tabName = "supportingInfo", icon = icon("support")),
      menuItem("Help", icon = icon("gear"),
               menuSubItem("Documentation", tabName = "documentation"),
               menuSubItem("Task", tabName = "task"),
               menuSubItem("Tutorials", tabName = "tutorials")
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              h2("Hight Interactive Data Analysis Platform"),
              #p(class = "text-muted",
                #paste("Under construction...")
              #),
              
              fluidRow(
                box(
                  title = "HIDAP v1.0 build 1 [4/4/2016]", height = "400px",
                  img(src="sw_0_2792.jpg", width = "100%"),
                  h5("What is the HIDAP"),
                  p(class = "text-muted", style="text-align:justify",
                    paste("HIDAP is a tool designed to help potato plant breeders carry out field trial planning, documentation, analysis and reporting")
                  ),
                  tags$div(style = "text-align: center;", class = "text-muted",
                           p("Design tabular forms ==> Enter data & meta-data ==> Checkin & analyze data")
                  )
                ),
                
                box(
                  title = "Features of the HIDAP", height = "400px",
                  column(width = 6,
                         tags$ul(style="text-align:justify", class = "text-muted",
                                 tags$li("The tool supports many types of potato trials."),
                                 tags$li("Organize your local database of trials."),
                                 tags$li("Create forms as a collection of tables in Excel. . Users create the forms on a PC or laptop and the forms may be transferred to other hardwre tools for data collection like Pocket PCs or tables."),
                                 tags$li("Data integrity checks upon check of filled-in forms into your local database."),
                                 tags$li("Missing data calculation."),
                                 tags$li("Standard descriptive statistical analysis."),
                                 tags$li("Summaries by genotype.")#,
                                 #tags$li("Derived variables are calculated as data allow and according to conventions in the data dictionary.")
                         )
                  ),
                  
                  column(width = 6,
                         selectInput(inputId = "n_breaks",
                                     label = "Number of modules in histogram:",
                                     choices = c(10, 20, 35, 50),
                                     selected = 20
                         ),
                         plotOutput(outputId = "main_plot", height = "250px")
                  )
                )
              ),
              
#               fluidRow(
#                 box(
#                   title = "System requirement", width = 4, height = "350px",
#                   h5("Hardware"),
#                   tags$ul(style="text-align:justify", class = "text-muted",
#                           tags$li("1 processor of 1 gigahertz (GHz) or higher 32-bit (x86) or 64-bit (x64) *"),
#                           tags$li("1 gigabyte (GB) of RAM (32-bit) or 2 GB RAM (64-bit)"),
#                           tags$li("1 GB of available hard disk space (32-bit) or 2 GB (64-bit)"),
#                           tags$li("Internet access to download the installer")
#                   ),
#                 
#                   h5("Software"),
#                   tags$ul(style="text-align:justify", class = "text-muted",
#                           tags$li("Windows XP Service Pack 2 and later, Windows Vista, Windows 7, Windows 8"),
#                           tags$li("Google Chrome version 37 or later"),
#                           tags$li("Mozilla Firefox 42 or later")
#                   )
#                 ),
#                 box(
#                   title = "Technology Included", width = 4, height = "350px",
#                   tags$ul(style="text-align:justify", class = "text-muted",
#                           tags$li("Twitter Bootstrap Version 3.1.1"),
#                           tags$li("PHPExcel Version 1.8.0"),
#                           tags$li("TinyButStrong with opentbs 1.9.0"),
#                           tags$li("FullCalendar v2.0.0"),
#                           tags$li("AdminLTE")
#                   ),
#                   tags$div(style = "text-align: center;",
#                            tags$video(src = "example.mp4", type = "video/mp4", autoplay = NA, controls = NA, width = "60%", height = "60%")
#                   )
#                 ),
#                 
#                 box(
#                   title = "Installation", width = 4, height = "350px",
#                   tags$ol(style="text-align:justify", class = "text-muted",
#                           tags$li("Download HIDAP v1.0 built? from", tags$a(href="https://research.cip.cgiar.org/confluence/display/GDET4RT/Home", "https://GDET4RT/Home/HIDAP/downloads/"), "an extract to your computer"),
#                           tags$li("Please, wait a few seconds while download the HIDAP installer"),
#                           tags$li("Clic the RUN button to start the HIDAP installer"),
#                           tags$li("Select a language, then clic OK button to continue the installation"),
#                           tags$li("Please, select the route where the software will be installed, clic in INSTALL button to continue with the installation"),
#                           tags$li("Finally, clic the CLOSE button to finish the installation")
#                   )
#                 )
#               ),
              
              fluidRow(
                box(
                  title = "CIPFBS report", width = 12, status = "primary", solidHeader = TRUE, collapsible = TRUE,
                  tags$iframe(src = "http://176.34.251.32/cipfieldbookstorage_dev/protected/extensions/grid/demo.php",
                              seamless=NA, width = "100%", height = "400px"
                  )
                )
              ),
              
              tags$div(style = "color: #9b9691;float: right;", "Development by Research Informatic Unit - RIU"),
              
              br(),
              br(),
              br()
      ),
      tabItem(tabName = "newFieldbook",
              h2("New fieldbook"),
              
              p(class = "text-muted", style="text-align:justify",
                paste("The fieldbook in HIDAP as you will see below is made up of several sheets and these are linked in different manners. If you want to make changes outside what is described in the following steps only do so on a copy, not in the original. Changes may prevent HIDAP from working, and you will probably not be able undo the changes.")
              ),
              
              fluidRow(
                box(
                  title = "Fieldbook", status = "warning", solidHeader = TRUE, width = 12,
                  collapsible = TRUE,
                  tabBox(
                    id = "tabset1", height = "500px",
                    tabPanel("Tab1", "First tab content"),
                    tabPanel("Tab2", "Tab content 2"),
                    tabPanel("Tab3", "Tab content 3"),
                    tabPanel("Tab4", "Tab content 4"),
                    tabPanel("Tab5", "Tab content 5"),
                    tabPanel("Tab6", "Tab content 6"),
                    tabPanel("Tab1", "First tab content"),
                    tabPanel("Tab2", "Tab content 2"),
                    tabPanel("Tab3", "Tab content 3"),
                    tabPanel("Tab4", "Tab content 4"),
                    tabPanel("Tab5", "Tab content 5"),
                    tabPanel("Tab6", "Tab content 6"),
                    tabPanel("Tab7", "Tab content 7")
                  )
                )
              ),
              
              fluidRow(
                HTML('<div style="float: right; margin: 0 15px 18px 0px;">'),
                  actionButton("bookPreview", "Book preview", icon("table"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                  actionButton("download", "Download", icon("file-excel-o"), style="color: #fff; background-color: #51a351; border-color: #51a351"),
                HTML('</div>')
              ),
              
              fluidRow(
                box(
                  title = "Fieldbook", status = "primary", solidHeader = TRUE, width = 12,
                  collapsible = TRUE,
                  "Book preview"
                )
              ),
              
              br()
      ),
      tabItem(tabName = "checkFieldbook",
              h2("Check fieldbook"),
              
              tabsetPanel(
                tabPanel("Tab1",
                         br(),
                         fluidRow(
                           column(width = 3,
                                  box(
                                    title = "Under construction...", status = "warning", solidHeader = TRUE, collapsible = TRUE, width = NULL,
                                    p(class = "text-muted",
                                      paste("Under construction...")
                                    )
                                  )
                           ),
                           
                           column(width = 9,
                                  box(
                                    title = "Under construction...", width = NULL, collapsible = TRUE, status = "info",
                                    p(class = "text-muted",
                                      paste("Under construction...")
                                    )
                                  )
                           )
                         )
                ),
                tabPanel("Tab2"),
                tabPanel("Tab3"),
                tabPanel("Tab4"),
                tabPanel("Tab5")
              )
      ),
      tabItem(tabName = "analysis",
              h2("Analysis"),
              p(class = "text-muted",
                paste("Under construction...")
              )
      )
    ),

    tags$div(
      fluidRow(
          tags$footer(
            a(
              list(
                tags$div(id = "test", img(src="88x31_v2.png"), "2016 International Potato Center. Av La Molina 1895, La Molina - Peru.")
              ),
              href="#"
            ),
            tags$style("footer {background-color: #222d32;height: 40px;position: absolute;bottom: 0;width: 100%;}"),
            tags$style("#test {color: #fff;padding-top: 5px;}")
          )
      )
    )

  )
)