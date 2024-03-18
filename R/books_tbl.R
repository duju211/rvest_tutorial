books_tbl <- function(df_books) {
  df_books |>
    gt() |>
    fmt_url(link, label = "Details") |>
    text_transform(
      locations = cells_body(columns = link_image),
      fn = function(x) {
        web_image(url = x)
      }
    )
}
