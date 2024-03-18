starwars_wiki <- function(starwars_wiki_url) {
  html <- read_html(starwars_wiki_url)

  html |>
    html_elements(".tracklist") |>
    html_table() |>
    map(\(x) mutate(x, `No.` = as.character(`No.`))) |>
    bind_rows()
}
