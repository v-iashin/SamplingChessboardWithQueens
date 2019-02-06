# Queens on a Chessboard and Simulated Annealing

	     [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
	[1,]    0    0    0    1    0    0    0    0
	[2,]    0    1    0    0    0    0    0    0
	[3,]    0    0    0    0    1    0    0    0
	[4,]    0    0    0    0    0    0    0    1
	[5,]    0    0    0    0    0    1    0    0
	[6,]    1    0    0    0    0    0    0    0
	[7,]    0    0    1    0    0    0    0    0
	[8,]    0    0    0    0    0    0    1    0

## Problem Statement
How to simulate a `m` by `n` chessboard with `k, k << m*n` queens on it such that no queen defeats another?

## Algorithm

_Translation of [Алгоритм имитации отжига (machinelearning.ru)](http://www.machinelearning.ru/wiki/index.php?title=%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC_%D0%B8%D0%BC%D0%B8%D1%82%D0%B0%D1%86%D0%B8%D0%B8_%D0%BE%D1%82%D0%B6%D0%B8%D0%B3%D0%B0)_

1. Choose a feasible state. Select an initial temperature
2. Evaluate the chosen metric on the initial state
3. Base step
	1. Randomly change the current state
	2. Evaluate the changed state
	3. Decide whether to accept the new state
4. Reduce the temperature, if the reduced temperature is still higher than the chosen threshold, repeat the Base step 

#### Choose a feasible state. Select an initial temperature
Generally, it is a good idea to randomly generate an initial state. Also, the initial state might be the result of another algorithm. If the initial temperature is chosen to be too high the algorithm will require a substantial amount of time to complete. On the other hand, if it was chosen to be quite low the algorithm may stuck in a local optimum.

#### Evaluate the initial state
This particular step depends on the task one is doing. In any case though, it is essential to choose a metric to optimize. In this algorithm, this metric is called _energy_. If a proper metric cannot be found, it is recommended to use another algorithm for optimization.

#### Base step
This step repeats for a chosen number of times (or just once) for each value of temperature. Also, it is possible to represent the number of repetitions as a function of a current temperature.

##### Randomly change the current state
This step may vary from task to task but the changes in the states should be local. For example, in the TSP, a good strategy is to randomly select two cities and exchange their position in the sequence. After that, there will be two states: the current and the new ones.

##### Decide whether to accept the new state
Let us assume that we want to minimize the metric (energy). Then, if a new state have a lower energy than a current one, the new state is accepted; however, if the new state have a lower energy than the current one, the new state can still be accepted but with probability as follows

<a href="https://www.codecogs.com/eqnedit.php?latex=P&space;=&space;\exp\bigg(\frac{\Delta&space;E}{T}\bigg)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?P&space;=&space;\exp\bigg(\frac{\Delta&space;E}{T}\bigg)" title="P = \exp\bigg(\frac{\Delta E}{T}\bigg)" /></a> 

- <a href="https://www.codecogs.com/eqnedit.php?latex=P" target="_blank"><img src="https://latex.codecogs.com/gif.latex?P" title="P" /></a> — probability of accepting a new state if the energy is worse than the current's;
- <a href="https://www.codecogs.com/eqnedit.php?latex=\Delta&space;E" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\Delta&space;E" title="\Delta E" /></a> — absolute value of difference between energies of the new and the current states;
- <a href="https://www.codecogs.com/eqnedit.php?latex=T" target="_blank"><img src="https://latex.codecogs.com/gif.latex?T" title="T" /></a> — current temperature.

#### Reduce the temperature if the reduced temperature is still higher than a chosen threshold
An important part of the algorithm is the rule of the temperature reduction. The higher temperature the more likely the non-optimal state will be accepted. However, as algorithm iterates the probability of acceptance of the non-optimal solution reduces. The rule of the temperature reduction should be chosen experimentally though it is important to lower it monotonically to zero. A good approach is to multiply the temperature by some constant that is slightly less than 1.

## Files
- `init_cond.R` — generates a random chessbord given number of queens for an arbitrary chessboard;
- `neighbourhood.R` — returns a list of neighbours for a given queen (its index) and a state;
- `energy.R` — calculates the number of queens that can be defeated by another ones given state;
- `change_cond.R` — returns a changed state that is different from the previous state by one queen;
- `acceptance.R` — returns boolean whether to accept the new state given both states and a temperature;
- `simulated_annealing.R` — returns the state with the optimum that the algorithm found given the number of queens, dimentions, and whether to verbose the process;
- `example.R` — provides an example of use.
