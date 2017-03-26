# returns a list of neighbours for a given a queen (its index) and a condition
function(queen_idx, condition) {
    
    dim_x <- nrow(condition)
    dim_y <- ncol(condition)
    # for the sake of comprehension assign indeces to two different values
    i <- queen_idx[1]
    j <- queen_idx[2]
    # list of indices for each queen
    queens <- which(condition == 1, arr.ind = TRUE)
    # reserve a list
    neighbours <- list()
    
    ## in this problem there are four types of neighbouring:
    # vertical (|) neighbours for Q(i, j) are Q(k, j) 
    # for all k in [1, dim_x]
    domain <- seq(1, dim_x)
    
    # for each element in the domain
    for (d in 1:length(domain)) {
        k <- domain[d]
        
        # if the number of TRUEs is more than zero implement
        if (sum(queens[,1] == k & queens[,2] == j) > 0) {
            
            # to prevent: 'a queen is neighbour to herself'
            if (k != i) {
                # append the new index to the list
                neighbours <- c(neighbours, list(c(k, j)))
            }
        }
    }
    # horizontal (--) neighbours for Q(i, j) are Q(i, k) 
    # for all k in [1, dim_y]
    domain <- seq(1, dim_y)
    
    # for each element in the domain
    for (d in 1:length(domain)) {
        k <- domain[d]
        
        # if the number of TRUEs is more than zero implement
        if (sum(queens[,1] == i & queens[,2] == k) > 0) {
            
            # to prevent: 'a queen is neighbour to herself'
            if (k != j) {
                # append the new index to the list
                neighbours <- c(neighbours, list(c(i, k)))
            }
        }
    }
    # diag (\) neighbours for Q(i, j) are Q(i+k, j+k) 
    # for all k in [1-i, dim_x-i] intersect [1-j, dim_y-j]
    domain <- intersect(seq(1-i, dim_x-i), seq(1-j, dim_y-j))
    
    # for each element in the domain
    for (d in 1:length(domain)) {
        k <- domain[d]
        
        # if the number of TRUEs is more than zero implement
        if (sum(queens[,1] == (i + k) & queens[,2] == (j + k)) > 0) {
            
            # to prevent: 'a queen is neighbour to herself'
            if (k != 0) {
                # append the new index to the list
                neighbours <- c(neighbours, list(c((i + k), (j + k))))
            }
        }
    }
    # diag (/) neighbours for Q(i, j) are Q(i+k, j-k) 
    # for all k in [1-i, dim_x-i] intersect [-dim_y+j, -1+j]
    domain <- intersect(seq(1-i, dim_x-i), seq(-dim_y+j, -1+j))
    
    # for each element in the domain
    for (d in 1:length(domain)) {
        k <- domain[d]
        
        # if the number of TRUEs is more than zero implement
        if (sum(queens[,1] == (i + k) & queens[,2] == (j - k)) > 0) {
            
            # to prevent: 'a queen is neighbour to herself'
            if (k != 0) {
                # append the new index to the list
                neighbours <- c(neighbours, list(c((i + k), (j - k))))
            }
        }
    }
    return(neighbours)
}