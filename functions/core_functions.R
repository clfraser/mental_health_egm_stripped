####################### Core functions #######################

# Add n linebreaks
linebreaks <- function(n){HTML(strrep(br(), n))}

# Remove warnings from icons 
icon_no_warning_fn = function(icon_name) {
  icon(icon_name, verify_fa=FALSE)
}

################### Create definition modals #########################

# Modal when topic is filtered on
defs_topic_modal <- function(topic){
  defs_filtered <- glossary_list %>%
    filter(Topic == topic) %>%
    select(-Topic)
  
  output$defs_table <- renderTable(defs_filtered)
  
  showModal(modalDialog(
    title = paste(topic, "definitions"),
    tableOutput("defs_table"),
    easyClose = TRUE
  ))
}

# Modal when term is filtered on
defs_term_modal <- function(term){
  defs_filtered <- glossary_list %>%
    filter(Term == term) %>%
    select(-Topic)
  
  output$defs_table <- renderTable(defs_filtered)
  
  showModal(modalDialog(
    title = paste(term, "definition"),
    tableOutput("defs_table"),
    easyClose = TRUE
  ))
}

# CSV download button for table

csvDownloadButton <- function(id, filename = "data.csv", label = "Download as CSV") {
  tags$button(
    tagList(icon("download"), label),
    onclick = sprintf("Reactable.downloadDataCSV('%s', '%s')", id, filename)
  )
}

# Show a navy navigation spinner

withNavySpinner <- function(out){
  withSpinner(out, color = navy)
}