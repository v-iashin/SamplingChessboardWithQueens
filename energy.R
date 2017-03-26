# returns the number of queens that can be defeated by another given condition
function(condition) {
    
    dim_x <- nrow(condition)
    dim_y <- ncol(condition)
    # stays here! because it changes 
    queens <- which(condition == 1, arr.ind = TRUE)
    # reserve a list
    reachable <- list()
    
    # for each queen add its neighbours (the queens that can defeat this one)
    for (i in 1:nrow(queens)) {
        # assign the index to another variable
        queen_idx <- queens[i, ]
        # remove the names that were assigned by 'which' function above
        names(queen_idx) <- NULL
        # find the neighbours for a queen
        neighbours <- neighbourhood(queen_idx, condition)
        # add the neighbours to the list
        reachable <- c(reachable, neighbours)
    }
    # remove duplicates: Q(1, 1) defeats Q(2, 2) and vice-versa
    reachable <- unique(reachable)
    
    return(length(reachable))
}