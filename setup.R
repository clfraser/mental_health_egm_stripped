####################### Setup #######################

# Shiny packages ----
library(shiny)
library(shinycssloaders)
library(shinymanager)
library(shinyWidgets)
library(reactable)
library(reactablefmtr)
library(tippy)
library(shinyjs)
library(shinyBS)
library(cicerone)
library(jsTreeR)
library(shinydashboard)

# Data wrangling packages ----
library(tidyverse)
library(janitor)
library(jsonlite)
library(stringr)
library(readxl)
library(jsonlite)

# Plotting packages ----
library(plotly)
library(ggh4x)

# Package for relative file references (needed to deploy app) 
library(here)

# HTML tools
library(htmltools)

## Load in data

## Dataframe for plots
reviews_chart <- readRDS(here("data/self-harm_egm_chart_data.rds"))

# Dataframe for table
reviews_table <- readRDS(here("data/self-harm_egm_table_data.rds"))

# Dataframe for glossary list
glossary_list <- read_xlsx(here("data/Definitions.xlsx"), sheet = "List")

# Set navy colour

navy <- "#010068"

# Get Cicerone functions
source(file.path("functions/guided_tours.R"), local = TRUE)$value

# Get core functions
source(file.path("functions/core_functions.R"), local = TRUE)$value