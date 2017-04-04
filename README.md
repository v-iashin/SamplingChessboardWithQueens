# Simulated Annealing

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
How to simulate a `m` by `n` chessboard with `k, k << mn` queens on it such that no queen defeats another.

## Algorithm

_Translated from [Алгоритм имитации отжига (machinelearning.ru)](http://www.machinelearning.ru/wiki/index.php?title=%D0%90%D0%BB%D0%B3%D0%BE%D1%80%D0%B8%D1%82%D0%BC_%D0%B8%D0%BC%D0%B8%D1%82%D0%B0%D1%86%D0%B8%D0%B8_%D0%BE%D1%82%D0%B6%D0%B8%D0%B3%D0%B0)_

1. Choose any feasible condition and select initial and threshold temperature 
2. Evaluate the initial condition
3. Base step
	1. Randomly change the current condition
	2. Evaluate the changed condition
	3. Decide whether to accept the new condition
4. Reduce the temperature, if the reduced temperature is still higher that chosen threshold, repeat Base step 

#### Choose any feasible condition and select initial and threshold temperature 
Is is not a bad idea to start with a random condition. Also, it is also sometimes reasonable to choose the result of another algorithm as the initial condition. Then, the temperature. If the initial temperature was selected to be too high the implementation of the algorithm will more time than if it was chosen to be quite low. On the other hand, if it is too low the algorithm may be stuck in a local optimum. Naturally, the initial temperature should be high and the threshold temperature should be close to zero.

#### Evaluate the initial condition
This step depends on the task. The only one requirement is that a metric (value to optimize) should be chosen. In this algorithm, this metric is called _energy_. If a proper metric cannot be found, it is reasonable to use another algorithm.

#### Base step
This step is repeated for some number of times (or just once) for each temperature. It is possible to relate the temperature and the number of runs on each temperature. 

##### Randomly change the current condition
This step depends on the given task. However, the changes in the conditions should be local. For example, in the commie voyager problem, a good strategy is to randomly choose two cities and exchange their position in the sequence. After that, there will be two conditions current and new.

##### Decide whether to accept the new condition
Let us assume that the metric (energy) should be minimized. Then, if the new condition have lower energy than the current one, the new condition is accepted; else if the new condition have lower energy than the current, the new condition is accepted with 

<a href="https://www.codecogs.com/eqnedit.php?latex=P&space;=&space;\exp\bigg(\frac{\Delta&space;E}{T}\bigg)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?P&space;=&space;\exp\bigg(\frac{\Delta&space;E}{T}\bigg)" title="P = \exp\bigg(\frac{\Delta E}{T}\bigg)" /></a> 

- <a href="https://www.codecogs.com/eqnedit.php?latex=P" target="_blank"><img src="https://latex.codecogs.com/gif.latex?P" title="P" /></a> — probability of accepting the new condition if the energy is worse than the current's;
- <a href="https://www.codecogs.com/eqnedit.php?latex=\Delta&space;E" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\Delta&space;E" title="\Delta E" /></a> — absolute value of difference between energies of the new and the current conditions;
- <a href="https://www.codecogs.com/eqnedit.php?latex=T" target="_blank"><img src="https://latex.codecogs.com/gif.latex?T" title="T" /></a> — current temperature.

#### Reduce the temperature if the reduced temperature is still higher than a chosen threshold
An important part of the algorithm is the rule of temperature reduction. The higher temperature the more likely the non-optimal condition will be accepted. However, as algorithm iterates the probability to accept non-optimal solution is lowering. The rule of temperature reduction should be chosen experimentally. It is important to be lower it monotonically to zero. A good solution is to multiply the temperature by some constant that is slightly less than 1.

## Files
- `init_cond.R` — generates a random chessbord given number of queens for arbitrary chessboard;
- `neighbourhood.R` — returns a list of neighbours for a given queen (its index) and a condition;
- `energy.R` — calculates the number of queens that can be defeated by another given condition;
- `change_cond.R` — returns a changed condition that is different from the previous by one queen;
- `acceptance.R` — returns boolean whether to accept the new condition given both conditions and a temperature;
- `simulated_annealing.R` — returns the state with the optimum that the algorithm found given number of queens, dimentions, and whether to verbose the process.
- `example.R` — provides an example of use.
