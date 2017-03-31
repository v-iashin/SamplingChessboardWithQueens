## LOADING FUNCTION FROM WORKING DIRECTORY ##
# returns a random chessbord given number of queens for arbitrary chessboard
# matrix with 1 -- queen, 0 -- empty
init_cond <- dget(file = 'init_cond.R')

# returns a list of neighbours for a given a queen (its index) and a condition
neighbourhood <- dget(file = 'neighbourhood.R')

# returns the number of queens that can be defeated by another given condition
energy <- dget(file = 'energy.R')

# returns a changed condition that is different from the prev. one by one queen
change_cond <- dget(file = 'change_cond.R')

# returns whether to accept the new condition given both conditions and temperature
acceptance <- dget(file = 'acceptance.R')

# returns the state with the optimum that the algorithm found given # of queens,
# dimentions, and whether to show the progress
simulated_annealing <- dget(file = 'simulated_annealing.R')

## PARAMETERS ##
set.seed(4)
# let's solve our task
sampled <- simulated_annealing(queens = 8, dims = c(8, 8), verbose = F)
print(sampled)
print(paste0('Energy = ', energy(sampled)))
