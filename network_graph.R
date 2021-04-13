library("readxl")


#network for top 10 users
nodes <- read_excel("Top10_nodes.xlsx")
links <- read_excel("Top10_edges.xlsx")

# Examine the data:
nrow(nodes)
nrow(links) 
nrow(unique(links[,c("from", "to")]))

links <- links[order(links$from, links$to),]
#colnames(links)[4] <- "weight"
rownames(links) <- NULL

# Converting the data to an igraph object:
net <- graph_from_data_frame(d=links, vertices=nodes, directed=T) 

# We can look at the nodes, edges, and their attributes:
E(net)
V(net)

V(net)$media

plot(net, edge.arrow.size=.4,vertex.label=NA)

# Removing loops from the graph:
net <- simplify(net, remove.multiple = F, remove.loops = T) 

# Set node color to orange and the border color to hex #555555
# Replace the vertex label with the node names stored in "media"
plot(net, edge.arrow.size=.2, edge.curved=0.5,
     vertex.color="orange", vertex.frame.color="#555555",
     vertex.label=V(net)$media, vertex.label.color="black",
     vertex.label.cex=.7) 



#network for all users
nodes <- read_excel("all_network_nodes.xlsx")
links <- read_excel("all_network_edges.xlsx")

# Examine the data:
nrow(nodes)
nrow(links) 
nrow(unique(links[,c("from", "to")]))

links <- links[order(links$from, links$to),]
#colnames(links)[4] <- "weight"
rownames(links) <- NULL

# Converting the data to an igraph object:
net <- graph_from_data_frame(d=links, vertices=nodes, directed=T) 

# We can look at the nodes, edges, and their attributes:
E(net)
V(net)

V(net)$media

plot(net, edge.arrow.size=.4,vertex.label=NA)

# Removing loops from the graph:
net <- simplify(net, remove.multiple = F, remove.loops = T) 

# Set node color to orange and the border color to hex #555555
# Replace the vertex label with the node names stored in "media"
plot(net, edge.arrow.size=.2, edge.curved=0.5,
     vertex.color="orange", vertex.frame.color="#555555",
     vertex.label=V(net)$media, vertex.label.color="black",
     vertex.label.cex=.7) 

