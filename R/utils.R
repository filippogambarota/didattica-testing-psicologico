html_slides <- function(){
  all_rmd <- list.files("slides", pattern = ".Rmd$", full.names = TRUE, recursive = TRUE)
  for(i in 1:length(all_rmd)){
    html <- rmarkdown::render(all_rmd[i], clean = TRUE, quiet = TRUE)
  }
}

pdf_slides <- function(){
  all_html <- list.files("slides", pattern = ".html$", full.names = TRUE, recursive = TRUE)
  for(i in 1:length(all_rmd)){
    html <- renderthis::to_pdf(all_html[i])
  }
}

solutions_meme <- function(){
  knitr::include_graphics(here::here('files/img/think-meme.jpg'))
}