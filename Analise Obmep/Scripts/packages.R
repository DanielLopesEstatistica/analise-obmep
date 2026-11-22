check_install = function(x){
  if(!require(x, character.only = TRUE, warn.conflicts	 = FALSE)){
    install.packages(x, warn.conflicts	 = FALSE)
  }
}

check_install = Vectorize(check_install)

packages = c("dplyr", "sf", "leaftlet", "leaftlet.extras", "htmlwidgets")

check_install(packages)

library(dplyr)
library(sf)
library(leaflet)
library(leaflet.extras)
library(htmlwidgets)

