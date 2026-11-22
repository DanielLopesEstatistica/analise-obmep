if(!file.exists("Bancos/Poligonos/BR_Municipios_2022.shp")){
  stop("Baixe o arquivo com os poligonos")
}

poligonos = sf::read_sf("Bancos/Poligonos/BR_Municipios_2022.shp")

poligonos$NM_MUN = poligonos$NM_MUN |> toupper() |> iconv(to = "ASCII//TRANSLIT") |>
  stringr::str_replace(pattern = "'", replacement = "") |> stringr::str_replace(pattern = "`", replacement = "")

poligonos = poligonos[,c(2,3)]

dados = left_join(dados, poligonos, by = join_by(MUNICIPIO == NM_MUN, UF == SIGLA_UF))

rm(poligonos)
