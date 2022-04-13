## code to prepare `edges` dataset goes here

usethis::use_data(edges, overwrite = TRUE)

rm(list = ls())

# Libraries ---------------------------------------------------------------
library(visNetwork)
library(geomnet)
library(igraph)


# Data Preparation --------------------------------------------------------

#Load dataset
data(lesmis)

#Nodes
nodes <- as.data.frame(lesmis[2])
colnames(nodes) <- c("id", "label")

#id has to be the same like from and to columns in edges
nodes$id <- nodes$label

#Edges
edges <- as.data.frame(lesmis[1])
colnames(edges) <- c("from", "to", "width")

usethis::use_data(edges, overwrite = TRUE)

