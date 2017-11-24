

server <- function(input, output, session) {
  

  # download package into usbfile ---------------------------------------------

  package_list <- reactive({
    text <- input$package_list_text
    return(text)
  })
  os_path <- reactive({
    os_text <- input$dev_path_text %>% as.character()
    return((os_text))
  })
  
  observeEvent(input$do,{
    input_dir <- os_path()
    text <- package_list()
    eval(parse(text = paste("pkgs_list <- c(",text,")")))
    pkgs <- pkgDep(c(pkgs_list))

    # mac OSなら
    if(input$switch_os == FALSE){
      showNotification("Download started.")
      download.packages(pkgs, destdir = input_dir, type = "source")
      showNotification("done.")
    }
    # windows OSなら
    else if(input$switch_os == TRUE){ 
      showNotification("Download started.")
      download.packages(pkgs, destdir = input_dir, type = "win.binary")
      showNotification("done.")
    }
    filelist <- list.files(path = input_dir, full.names = T)
  })

# R code for install ------------------------------------------------------

  output$code_for_install <- renderUI({
    # ファイルリストアップ　---
    filelist <- list.files(path = os_path(), full.names = T)
    package_file_list <- filelist %>% as.data.frame()
    file_list_str <- paste("'",package_file_list[1,],"'", sep= "")
    # ファイルのリストを横一列に並べる ---
    for(i in 2:nrow(package_file_list)){
      file_list_str <- paste(file_list_str, 
                             paste("'",package_file_list[i,],"'", sep = ""),
                             sep = ",<br/>")
    }
    # mac OS
      if(input$switch_os == FALSE){ 
        out <- HTML(paste(maccode, file_list_str, maccode2, sep = ""))
      }
    # windows OS
      else if(input$switch_os == TRUE){
        out <- HTML(paste(wincode, file_list_str, wincode2, sep = ""))
      }
    return(out)
  })  

# guide -------------------------------------------------------------------

  observeEvent(input$help,
               introjs(session, options = list("nextLabel"="次へ",
                                               "prevLabel"="前に戻る",
                                               "skipLabel"="スキップ"),
                       events = list("oncomplete"='alert("終了")'))
  )  
  
}