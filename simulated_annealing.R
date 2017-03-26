# returns the state with the optimum that the algorithm found given # of queens,
# dimentions, and whether to show the progress
function(queens, dims, verbose = FALSE, temp_max = 1,
                                temp_min = 0.001, rate = 0.999) {
    
    # initial temperature is the max
    temperature <- temp_max
    
    # let's start with some initial state
    condition <- init_cond(queens, dims)
    
    # until temperature is high enough implement
    while (temperature > temp_min) {
        
        # create a list with old and new conditions
        old_new_cond <- change_cond(condition)
        
        # if the new condition is accepted, assign it to the current condition
        # (see also how 'acceptance' func works)
        if (acceptance(old_new_cond$old, old_new_cond$new, temperature)) {
            condition <- old_new_cond$new
        }
        
        # reduce the temperature
        temperature <- temperature * rate
        
        # if a user chooses to see the progress print some intermediate steps
        if (verbose) {
            print(paste0('Energy: ', energy(condition), 
                         '; Temperature: ', round(temperature, 4)))
        }
    }
    return(condition)
}