mouse(jerry).
mouse(mickey).
cat(tom).
cat(garfield).

eatCheese(X) :- mouse(X).
chase(X,Y) :- cat(X), mouse(Y).

/**
mouse(X).
eatCheese(X).
eatCheese(X).
chase(X,Y).
chase(X,jerry).
	prolog machine:
		backtracking
		instantiation setting unknown to values
		database lookup
		proof by matching
		resolution.
 */




