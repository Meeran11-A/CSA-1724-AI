% Experiment 3: Family Tree
% SWISH: https://swish.swi-prolog.org/
%
% Family facts
% parent(Parent, Child).

male(john).
male(paul).
male(tom).
male(robert).

female(mary).
female(lisa).
female(anna).
female(susan).

parent(john, paul).
parent(mary, paul).
parent(john, lisa).
parent(mary, lisa).
parent(paul, tom).
parent(susan, tom).
parent(lisa, anna).
parent(robert, anna).

% Rules
father(Father, Child) :-
    male(Father),
    parent(Father, Child).

mother(Mother, Child) :-
    female(Mother),
    parent(Mother, Child).

child(Child, Parent) :-
    parent(Parent, Child).

sibling(Person1, Person2) :-
    parent(Parent, Person1),
    parent(Parent, Person2),
    Person1 \= Person2.

brother(Brother, Person) :-
    male(Brother),
    sibling(Brother, Person).

sister(Sister, Person) :-
    female(Sister),
    sibling(Sister, Person).

grandparent(Grandparent, Child) :-
    parent(Grandparent, Parent),
    parent(Parent, Child).

grandfather(Grandfather, Child) :-
    male(Grandfather),
    grandparent(Grandfather, Child).

grandmother(Grandmother, Child) :-
    female(Grandmother),
    grandparent(Grandmother, Child).

% Sample queries (run one at a time in SWISH):
% ?- father(john, paul).
% true.
%
% ?- mother(mary, lisa).
% true.
%
% ?- sibling(paul, lisa).
% true.
%
% ?- grandfather(john, tom).
% true.
%
% ?- parent(Parent, tom).
% Lists Tom's parents using backtracking.
%
% ?- sibling(Person, anna).
% Lists Anna's siblings, if any.
