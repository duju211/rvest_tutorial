books_all_resp <- function(books_url) {
  req <- request(books_url)

  next_url <- function(resp, req) {
    html <- resp |>
      resp_body_html()

    next_url <- html |>
      html_element(".next > a:nth-child(1)") |>
      html_attr("href")

    if (!is.null(next_url)) {
      return(request(url_absolute(next_url, req$url)))
    } else {
      return(NULL)
    }
  }

  req |>
    req_perform_iterative(next_url)
}
