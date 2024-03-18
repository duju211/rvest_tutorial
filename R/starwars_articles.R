starwars_articles <- function(starwars_articles_url) {
  html <- read_html(starwars_articles_url)

  rows <- html |>
    html_elements("section")

  tibble(
    episode = rows |> html_element("h2") |> html_attr("data-id") |> parse_integer(),
    title = rows |> html_element("h2") |> html_text2(),
    director = rows |> html_element(".director") |> html_text2(),
    release_date = rows |> html_element("p") |> html_text2() |> str_split(" ") |> map_chr(2) |> parse_date(),
    desc = rows |> html_element(".crawl") |> html_text2())
}
