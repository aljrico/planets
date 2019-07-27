usethis::use_data(planets, overwrite = TRUE, compress = 'xz')
devtools::document()
devtools::check()
devtools::build()

