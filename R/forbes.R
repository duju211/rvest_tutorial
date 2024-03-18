forbes <- function() {
  resp_forbes <- request("https://www.forbes.com/forbesapi/org/top-colleges/2023/position/true.json") |>
    req_url_query(limit = "1000") |>
    req_perform()

  json_forbes <- resp_forbes |>
    resp_body_json() |>
    _[["organizationList"]][["organizationsLists"]]

  map_df(json_forbes, \(x) as_tibble(x[!map_lgl(x, is_list)]))
}
