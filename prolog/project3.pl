/**
Phu Nguyen
Comp333 - Tue Thu 11:30-12:15
Project 3
*/

/** facts 1 - 2 */

female(mo).
female(thuy).
female(an).
female(duong).
female(tu).
female(ai).
male(phu).
male(chau).
male(tam).
male(ngoai).
male(phuc).


parent(ngoai, thuy).
parent(ngoai, tu).
parent(mo, chau).
parent(mo, tam).
parent(tu, phuc).
parent(thuy, ai).
parent(thuy, phu).
parent(chau, phu).
parent(chau, ai).
parent(tam, duong).
parent(tam,an).

/** facts 3 - 4 */

likes(sue, books).
likes(sue, music).
likes(john, music).
likes(joan,books).
likes(steven, art).
likes(nancy, music).
likes(nancy,art).
likes(cindy,movies).
likes(john, books).
likes(steven, movies).
likes(joan, movies).
likes(nancy, yoga).
likes(cindy,art).
likes(cynthia, yoga).
likes(tim,art).

/** rules */

/** rules 1 - 2 */

mother(X,Y) :-female(X), parent(X,Y).
father(X,Y)   :- male(X), parent(X, Y).

grandparent(X,Y ) :- parent(X,Z), parent(Z,Y).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y)  :-  parent(X,Z), ancestor(Z,Y).

descendant(X,Y) :- child(X,Y).
descendant(X, Y) :- child(X,Z), descendant(Z,Y).

grandfather( X,Y) :- male(X), grandparent(X,Y).
grandmother(X,Y) :- female(X), grandparent(X,Y).

child( X,Y) :- parent(Y,X).

siblings(X,Y) :- child(X,Z), child(Y,Z), not(X=Y).
brother(X,Y) :- male(X), siblings(X,Y).
sister(X,Y) :- female(X), siblings(X,Y).

aunt(X,Y) :- female(X), child(Y,Z), siblings(X,Z).
uncle(X,Y) :- male(X), child(Y,Z), siblings(X,Z).
firstcousins(X,Y) :- child(X,Z), child(Y,C), siblings(Z,C).

/** rules 3 */

sharedInterests(X,Y,Z) :- likes(X,Z), likes(Y,Z), not(X=Y).
moreThanOneInterest(X)  :-  likes(X,A), likes(X,B), not( A = B).

/** rules 4 */

popular(Z,N) :- setof(W, likes(W,Z), L), length(L,X), X>=N.

/** queries problem 2
setof( Z,  siblings(Z, thuy), L).
  L = [tu].
setof( Z,  firstcousins(Z, phu), L).
  L = [an, duong, phuc].
setof( Z,  aunt(Z, phu), X), setof( Z,  uncle(Z, phu), Y), append(X,Y,Z).
  Z = [tu, tam],
  X = [tu],
  Y = [tam].
setof( Z,  siblings(Z, phu), L).
  L = [ai].
setof( Z,  child(Z, mo), L).
  L = [chau, tam].
setof( Z,  ancestor(Z, phu), L).
  L = [chau, mo, ngoai, thuy].
setof( Z,  descendant(Z, ngoai), L).
  L = [ai, phu, phuc, thuy, tu].
*/

/** queries problem 3
11
likes(john,A).
  A = music ;
  A = books.
likes(A,movies).
  A = cindy ;
  A = steven ;
  A = joan.
sharedInterests(sue, john, Z).
  Z = books ;
  Z = music ;
  false.
sharedInterests(nancy,X, books).
  false.
sharedInterests(nancy,B,yoga).
  B = cynthia.
sharedInterests(nancy, B,Z).
  B = sue,
  Z = music ;
  B = john,
  Z = music ;
  B = steven,
  Z = art ;
  B = cindy,
  Z = art ;
  B = tim,
  Z = art ;
  B = cynthia,
  Z = yoga.
setof(X, likes(X,Z), People).
  Z = art,
  People = [cindy, nancy, steven, tim] ;
  Z = books,
  People = [joan, john, sue] ;
  Z = movies,
  People = [cindy, joan, steven] ;
  Z = music,
  People = [john, nancy, sue] ;
  Z = yoga,
  People = [cynthia, nancy].
setof(Z, likes(X,Z), Activities).
  X = cindy,
  Activities = [art, movies] ;
  X = cynthia,
  Activities = [yoga] ;
  X = joan,
  Activities = [books, movies] ;
  X = john,
  Activities = [books, music] ;
  X = nancy,
  Activities = [art, music, yoga] ;
  X = steven,
  Activities = [art, movies] ;
  X = sue,
  Activities = [books, music] ;
  X = tim,
  Activities = [art].

12
moreThanOneInterest(john).
  true ;
  true ;
  false.
moreThanOneInterest(X).
  X = sue ;
  X = sue ;
  X = john ;
  X = joan ;
  X = steven ;
  X = nancy ;
  X = nancy ;
  X = nancy ;
  X = nancy ;
  X = cindy ;
  X = john ;
  X = steven ;
  X = joan ;
  X = nancy ;
  X = nancy ;
  X = cindy ;
  false.
setof(X, moreThanOneInterest(X), People).
  People = [cindy, joan, john, nancy, steven, sue].
*/

/** query problem 4
?- popular(books,3).
  true.
?- popular(books,4).
  false.
*/
