# This file writes all the content in the script.qmd file to a compatible obsidian .md file so i can review and acess the code there. 

# Reading the file into a vector, each element is a line and remove the `{}` from the code (for syntax highlight in obsidian)
md_lines <- readLines("script.qmd")
md_lines <- gsub("```\\{r\\}", "```r", md_lines)

# Optionally, combine all lines into a single string if needed
md_lines <- paste(md_lines, collapse="\n")

#Write the combined content to a new Markdown file
writeLines(md_lines, "r_script.md")
