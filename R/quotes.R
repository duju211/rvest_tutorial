quotes <- function(quotes_url) {
  html <- read_html(quotes_url)

  rows <- html |>
    html_elements(".quote")

  tags <- rows |> html_element(".tags")

  tibble(
    quote = rows |> html_element(".text") |> html_text2(),
    author = rows |> html_element(".author") |> html_text2(),
    author_link = rows |> html_element("a") |> html_attr("href"),
    tags = map(tags, \(x) x |> html_elements(".tag") |> html_text())) |>
    mutate(author_link = str_glue("{quotes_url}{author_link}"))
}
