# Create the search string
# Search string "Source-ID () OR Source-ID ()"

search_scopus <- scopus_only |> 
  mutate(query = str_glue("(SOURCE-ID ({sourcerecord_id}))")) |> 
  # Uses pull to extract this new column as a vector.
  pull(query) |> 
  # Uses str_c with the collapse argument to concatenate all elements of the vector into a single string, separated by " OR "
  str_c(collapse = " OR ")

write_clip(content = search_scopus)