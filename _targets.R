source("libraries.R")

fun_dir <- dir_create("R")
walk(dir_ls(fun_dir), source)

list(
  tar_target(
    starwars_wiki_url,
    "https://en.wikipedia.org/wiki/Star_Wars_(soundtrack)"),
  tar_target(
    starwars_articles_url,
    "https://rvest.tidyverse.org/articles/starwars.html"),
  tar_target(quotes_url, "https://quotes.toscrape.com"),
  tar_target(books_url, "http://books.toscrape.com/"),

  tar_target(df_starwars_wiki, starwars_wiki(starwars_wiki_url)),
  tar_target(df_starwars_articles, starwars_articles(starwars_articles_url)),
  tar_target(df_quotes, quotes(quotes_url)),
  tar_target(tbl_quotes, quotes_tbl(sample_n(df_quotes, 5))),
  tar_target(resp_books, req_perform(request(books_url))),
  tar_target(df_books, books(resp_books)),
  tar_target(tbl_books, books_tbl(sample_n(df_books, 5))),
  tar_target(resp_books_all, books_all_resp(books_url)),
  tar_target(df_books_all, map_df(resp_books_all, books)),
  tar_target(tbl_books_all, books_tbl(sample_n(df_books_all, 5))),
  tar_target(df_forbes, forbes()),

  tar_render(rvest_tutorial_post, "rvest_tutorial_post.Rmd")
)
