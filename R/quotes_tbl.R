quotes_tbl <- function(df_quotes) {
  df_quotes |>
    gt() |>
    fmt_url(author_link, label = "Author Description")
}
