books <- function(resp_books) {
  html <- resp_books |>
    resp_body_html()

  rows <- html |>
    html_element("ol.row") |>
    html_children()

  rows_title <- rows |>
    html_element("article:nth-child(1) > h3:nth-child(3) > a:nth-child(1)")

  rows_price <- rows |>
    html_element("article:nth-child(1) > div:nth-child(4)")

  tibble(
    link_image = rows |>
      html_element(".image_container > a:nth-child(1) > img:nth-child(1)") |>
      html_attr("src"),
    rating = rows |>
      html_element("article:nth-child(1) > p:nth-child(2)") |>
      html_attr("class") |>
      str_split(" ") |>
      map_chr(2),
    title = html_attr(rows_title, "title"),
    link = html_attr(rows_title, "href"),
    price = rows_price |> html_element(".price_color") |> html_text() |> parse_number(),
    availability = rows_price |> html_element(".instock.availability") |> html_text2()) |>
    mutate(
      link = url_absolute(link, resp_books$url),
      link_image = url_absolute(link_image, resp_books$url))
}
