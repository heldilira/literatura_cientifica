extract_homepage_link <- function(url) {
  # Get the webpage content
  page <- httr::GET(url)
  
  # Check if the request was successful
  if (httr::status_code(page) == 200) {
    # Parse the HTML content
    html_content <- read_html(httr::content(page, "text"))
    
    # Extract the specific link using a more targeted CSS selector
    # Adjust the CSS selector to specifically find elements by ID 'question_journal'
    specific_link <- html_content %>%
      html_nodes("#question_journal") %>%  # ID selector
      html_attr("href") %>% # Get the 'href' attribute
      .[1]
    
    # Check if the link is extracted, if not return NA
    if (length(specific_link) > 0) {
      return(specific_link)
    } else {
      return(NA)
    }
  } else {
    return(NA)  # Return NA if the page fails to load
  }
}