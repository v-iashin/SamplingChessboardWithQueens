# returns a random chessbord given number of queens for arbitrary chessboard
# matrix with 1 -- queen, 0 -- empty
function(queens, dims = c(8, 8)) {
    
    # if the number of queens is higher than the number of cells, raise an error
    if (prod(dims) < queens) {
        stop(paste('I cannot locate', queens, 'queens on', prod(dims), 'cells'))
    }
    
    # assign the dimentions of a needed chessboard
    dim_x <- dims[1]
    dim_y <- dims[2]
    # reserve a place for each queen
    chessboard <- matrix(data = 0, nrow = dim_x, ncol = dim_y)
    
    # until the number of queens left is not zero implement
    while (queens > 0) {
        # choose randomly the row and column positions
        idx_x <- floor(dim_x * runif(1) + 1)
        idx_y <- floor(dim_y * runif(1) + 1)
        
        # if the choosen cell is empty place a queen on it & reduce the counter
        if (chessboard[idx_x, idx_y] == 0) {
            chessboard[idx_x, idx_y] <- 1
            queens <- queens - 1
        }
    }
    return(chessboard)
}