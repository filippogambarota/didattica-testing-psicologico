compile_slides <- function(online = FALSE, pdf = FALSE){
  slides <- list.files("slides/", full.names = TRUE, recursive = TRUE, pattern = ".Rmd$")
  filenames <- basename(slides)
  for(i in 1:length(slides)){
    compile(slides[i], online = online, pdf = pdf)
    cli::cli_alert_success(paste(filenames[i], "compiled! :)"))
  }
}

compile <- function(file, online = FALSE, pdf = FALSE){
  if(online){
    out_dir <- "slides"
  } else{
    out_dir <- "slides_online"
  }
  html <- rmarkdown::render(file, 
                            params = list(solutions = online),
                            output_dir = out_dir,
                            quiet = TRUE)
  if(pdf){
    renderthis::to_pdf(html)
  }
}

solutions_meme <- function(){
  knitr::include_graphics(here::here('files/img/think-meme.jpg'))
}