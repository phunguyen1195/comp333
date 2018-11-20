/** query */

female(sue).
female(mary).
female(jane).
female(helen).
female(anna).
male(joe).
male(bill).
male(george).
male(fred).
male(tom).

parent(joe, bill).
parent(mary, jane).
parent(mary, bill).
parent(george, joe).
parent(helen, mary).
parent(george, sue).
parent(anna, george).
parent(fred, helen).
parent(sue,tom).

/** rules */
mother(X,Y) :-female(X), parent(X,Y).
father(X,Y)   :- male(X), parent(X, Y).

grandparent(X,Y ) :- parent(X,Z), parent(Z,Y).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y)  :-  parent(X,Z), ancestor(Z,Y).

/**
grandparent(george,tom).
grandparent(x,jane).

** collect all grandparent of Bill then put dem all in a list.
?- setof(Z, grandparent(Z, bill), L).
L = [george, helen].

?- setof(A, grandparent(anna, A), L).
L = [joe, sue].

** ancestor rule
?- setof(A, ancestor(A, bill), L).
L = [anna, fred, george, helen, joe, mary].
*/
