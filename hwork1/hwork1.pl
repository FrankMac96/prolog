/**
    Frank MacDonald
    CS 4800
    Dr.Marling
*/
male(frank). % me
male(john). % dads brother
male(dominic). % brother
male(jake). % Grandpa(mom)
male(frank2). % dad
male(john2). % Grandpa(dad)

female(larissa). % mom
female(lee). % Grandma(dad)
female(lee2). % Grandma(mom)
female(susan). % Dads sister
female(angel). % moms sister
female(ciera). % half sister
female(tasha). % half sister

sibling(dominic,frank).
sibling(ciera,frank).
sibling(tasha,frank).

father(john,frank2).
father(john,john2).
father(john,susan).
father(jake,larissa).
father(jake,angel).
father(frank2,frank).
father(frank2,dominic).
father(frank2,ciera).
father(frank2,tasha).

mother(lee,frank2).
mother(lee,john).
mother(lee,susan).
mother(lee2,larissa).
mother(lee2,angel).
mother(larissa,frank).
mother(larissa,dominic).

/**grandmother(lee,frank).
grandmother(lee,dominic).
grandmother(lee,ciera).
grandmother(lee,tasha).
grandmother(lee2,frank).
grandmother(lee2,dominic).
grandmother(lee2,ciera).
grandmother(lee2,tasha).

grandfather(jake,frank).
grandfather(jake,dominic).
grandfather(jake,ciera).
grandfather(jake,tasha).
grandfather(john,frank).
grandfather(john,dominic).
grandfather(john,ciera).
grandfather(john,tasha).*/

grandmother(X,Z) :- mother(X,N), mother(N,Z). 
grandmother(X,Z) :- mother(X,N), father(N,Z). 

sister(X,Z) :- female(X),sibling(X,Z).


