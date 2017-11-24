#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

ui <- material_page(title = "　Update your Packages　",
                    tags$br(),
                    font_color = "brown darken-3",
                    nav_bar_color = "brown darken-3",
                    
                    introjsUI(),
                    
                    material_parallax(
                      image_source = "wood-pen-usb-vintage"
                    ),
                    
                    material_row(
                      tags$br(),
                      div(h2("R Package Update"),
                          p("オフラインPCのパッケージインストールを自動化します"), align = "center"),
                      material_floating_button(input_id = "help", icon = "play_arrow" , #label = "ページの見方", 
                                               color = "brown darken-1", depth = 3)
                    ),
                    material_row( # ---------------
                                  material_column(width = 1),
                                  material_column(width = 10,
                                                  introBox(
                                                    material_text_box(
                                                      input_id = "package_list_text",
                                                      label = 'パッケージをカンマ区切りでリストしてください　ex) "shiny","ggplot2","dplyr", ...',
                                                      color = "#6d4c41"
                                                    ),
                                                  data.step = 1,
                                                  data.intro = 'パッケージをダブルクォートで囲んでリストします'
                                                  ), align = "center"
                                  ),
                                  material_column(width = 1)
                    ),
                    
                    material_row( # ---------------
                                  material_column(width = 4,
                                                  introBox(
                                                    material_switch(
                                                      input_id = "switch_os",
                                                      label = "OSを選択してください",
                                                      off_label = "Mac OS",
                                                      on_label = "Windows",
                                                      initial_value = FALSE,
                                                      color = "#6d4c41"
                                                    ),
                                                  data.step = 2,
                                                  data.intro = 'オフラインPCのOSを選択します'
                                                  ), align = "center"
                                  ),
                                  material_column(width = 6,
                                                  introBox(
                                                  material_text_box(
                                                    input_id = "dev_path_text",
                                                    label = "USBメモリのpathを入力してください　ex)　/Volumes/USB/",
                                                    color = "#6d4c41"
                                                  ),
                                                  data.step = 3,
                                                  data.intro = 'パッケージをインストールしたいフォルダ・USBなどのパスを入力します'
                                                  ), align = "center"
                                  ),
                                  material_column(width = 2,
                                                  introBox(
                                                    actionButton(inputId = "do", label = " DL", 
                                                                 icon =icon("download")),
                                                    data.step = 4,
                                                    data.intro = 'ダウンロードを実行します'
                                                  )
                                  )
                    ),
                    material_row( tags$br(), tags$br(),
                                  material_column(width = 12,
                                                  introBox(
                                                  material_modal(
                                                    modal_id = "showcase_modal",
                                                    button_text = "Code for install",
                                                    button_icon = "create",
                                                    button_color = "brown lighten-1",
                                                    title = " ",
                                                    div( 
                                                      material_card(
                                                        title = "Code for install",
                                                        htmlOutput("code_for_install")
                                                      ), align = "left")
                                                  ),
                                                  data.step = 5,
                                                  data.intro = 'クリックすると、必要なコードが出力されます'),
                                                  tags$br(),
                                                  div(helpText("@sasaki_K_sasaki"), align = "center", style = "color:grey;"), align = "center"
                                  )
                    )
                    
)
