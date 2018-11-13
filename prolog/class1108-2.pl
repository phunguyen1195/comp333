/** query */

female(sue).
female(mary).
female(jane).
male(joe).
male(bill).
parent(joe,bill).
parent(mary,jane).
parent(mary,bill).

/** rules */

mother(X,Y) :- female(X), parent(X,Y).
father(X,Y) :- male(X), parent(X,Y).

/**
prove: female(A), parent(A,B).

female(A)
try A=sue
	parent(sue,B). -> no match -> false, no such B.
try A=mary
	parent(mary, B). -> B = jane. success!
			 -> B = bill. success!
try A=jane
	parent(jane,B). -> no match -> false, no such B.


*/
