# returns a changed condition that is different from the prev. one by one queen
function(condition) {
    
    dim_x <- nrow(condition)
    dim_y <- ncol(condition)
    
    # save the old condition
    old_cond <- condition
    
    # set the number of changes that are needed to make
    counter <- 1
    
    # until the needed change is made run
    while (counter != 0) {
        # choose randomly the indices of a queen that we want to move
        idx_x_from <- floor(dim_x * runif(1) + 1)
        idx_y_from <- floor(dim_y * runif(1) + 1)
        # choose randomly the indices where we want to move it
        idx_x_to <- floor(dim_x * runif(1) + 1)
        idx_y_to <- floor(dim_y * runif(1) + 1)
        
        # if a random cell does contain a queen AND another is empty move it
        if (condition[idx_x_from, idx_y_from] == 1 &
            condition[idx_x_to, idx_y_to] == 0) {
            condition[idx_x_from, idx_y_from] <- 0
            condition[idx_x_to, idx_y_to] <- 1
            # reduce the counter
            counter <- counter - 1
        }
    }
    # assing a list with the new and the old conditions
    lst <- list('old' = old_cond, 'new' = condition)
    return(lst)
}