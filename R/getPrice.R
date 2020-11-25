#' Get current coin price from Coingecko
#'
#' This function gets the current price of a given token from Coingecko
#'
#' @param coin_id The id of the coin on Coingecko
#' @param currency The currency used to display the coin price
#' @param return a list containing the coin id, the currency used, and the current value of the coin

getPrice <- function(coin_id, currency) {

  # Create url from various pieces of information
  base <- "https://api.coingecko.com/api/v3"
  method <- "/simple/price"

  url <- paste0(base, method, "?ids=", coin_id, "&vs_currencies=", currency)

  # Submit a GET request with the URL and save the response in a variable
  response <- httr::GET(url)

  # Extract the data out into a list
  data <- jsonlite::fromJSON(rawToChar(response$content))
  return(data)
}
