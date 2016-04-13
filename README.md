# Project 4 Mining Amazon Movies Reviews
### Using Amazon Movie Reviews to Analyze Oscar Nominations for Best Picture

Group Members: Bob Minnich, Rong Wang, Aoyuan Liao, Josh Dillon, Ziyue Jin

### Project Summary
For our project we wanted to explore the Amazon Movies data set with a focus on the Oscars. We thought that this would be an interesting area to explore and try to determine if we can find any subpopulations of the movies by using graph theory as our distance metric. Using a netowork allows us to create distance matrices that can allow analysis for clustering and recommendations. Based on the analysis, we built a recommendation engine by Shiny App. We also wanted to determine if we could predict the winner of Best Picture based on the Amazon dataset.

Read our [project report](http://minnich49.github.io/Project_4_Host/) for more information.

### Contribution Statement
In this project, we built a network in order to calculate the similarity between movies .Also, the network gave us the visulization of the data so that we could analyze it for clustering and recommendations. Based on the analysis, we built a recommendation engine by Shiny App. We also predicted the winner of Best Picture based on the Amazon movie reviews. Bob Minnich worked on creating the network using Python and performed analysis using Shortest Path, Clique, MDS, distance recommendation based on movies seen, produced pairwise distance matrix between all movie nodes and designed a D3 network to represent the network analyzed. Rong Wang worked on building Recommendation System using Shiny App based on the distance matrix including writing User-Interface and Server, processing movie review scores, cleaning and manipulating raw data, matching pictures. Aoyuan Liao worked on processing and cleaning data, the algorithm to calculate the distance between the user node and the movie node, the core algorithm for the recommender engine, embellishing the interface of the app and preparing for the presentation.

