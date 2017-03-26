# returns whether to accept the new condition given both conditions and temperature
function(cond_old, cond_new, temperature) {
    
    # calculates the energy for both states
    energy_old <- energy(condition = cond_old)
    energy_new <- energy(condition = cond_new)
    
    # if the new energy is lower (we are minimizing) then accept
    if (energy_new < energy_old) {
        return(TRUE)
    } 
    
    # else accept new state with some probability 'prob'
    else {
        prob <- exp(-abs(energy_new - energy_old) / temperature)
        
        # if a randomly chosen value is lower than the probability accept
        if (runif(1) < prob) {
            return(TRUE)
        }
        else {
            return(FALSE)
        }
    }
}