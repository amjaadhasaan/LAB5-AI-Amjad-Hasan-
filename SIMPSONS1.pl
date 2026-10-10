male(abraham).
male(herb).
male(homer).
male(clancy).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).
parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).
parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).
parent(selma, ling).

father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).
sibling(X, Y) :- parent(P, X), parent(P, Y), dif(X, Y).
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).
grandfather(X, Z) :- parent(X, Y), parent(Y, Z), male(X).
aunt(X, Y) :- parent(P, Y), sister(X, P).
uncle(X, Y) :- parent(P, Y), brother(X, P).
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2).
ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).



% TEST QUERIES AND ANSWERS


% ?- father(homer, bart).
% true.
% ?- father(X, lisa).
% X = homer.

% ?- mother(marge, X).
% X = bart.
% ?- mother(mona, homer).
% true.

% ?- son(bart, homer).
% true.
% ?- son(X, marge).
% X = bart.

% ?- daughter(X, homer).
% X = lisa.
% ?- daughter(ling, selma).
% true.

% ?- brother(bart, lisa).
% true.
% ?- brother(herb, X).
% X = homer.

% ?- sister(X, bart).
% X = lisa.
% ?- sister(patty, selma).
% true.

% ?- grandfather(abraham, X).
% X = bart.
% ?- grandfather(clancy, X).
% X = bart.

% ?- aunt(X, bart).
% X = patty.
% ?- aunt(patty, ling).
% true.

% ?- uncle(herb, X).
% X = bart.
% ?- uncle(X, bart).
% X = herb.

% ?- cousin(bart, ling).
% true.
% ?- cousin(X, ling).
% X = bart.

% ?- ancestor(abraham, X).
% X = herb.
% ?- ancestor(X, ling).
% X = selma.