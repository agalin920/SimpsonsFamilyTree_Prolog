%Gender Clauses
%Male
male('Homer').
male('Abraham').
male('Bart').
male('Clancy').
male('SeymourSkinner').
male('MilHouse').
male('MrBurns').
male('SantasLittleHelper').
male('Kang').

%Female
female('Marge').
female('Lisa').
female('Maggie').
female('Mona').
female('Jacqueline').
female('Paty').
female('Selma').
female('EdnaKrabappel').
female('Snowball').

%Father Clauses
father('Abraham', 'Homer').
father('Clancy', 'Marge').
father('Clancy', 'Paty').
father('Clancy', 'Selma').
father('Homer', 'Bart').
father('Homer', 'Lisa').
father('Kang', 'Maggie').

%Mother Clauses
mother('Jacqueline', 'Marge').
mother('Jacqueline', 'Paty').
mother('Jacqueline', 'Selma').
mother('Mona', 'Homer').
mother('Marge', 'Bart').
mother('Marge', 'Lisa').
mother('Marge', 'Maggie').

%Parent predicate
parent(X,Y) :- father(X,Y); mother(X,Y).

%Child predicates
child(X,Y) :- parent(Y,X).
son(X,Y) :- child(X,Y), male(X).
daughter(X,Y) :- child(X,Y), female(X).

%Sibling predicates
sibling(X,Y) :- parent(Z,X), parent(Z,Y), X \= Y.
brother(X,Y) :- sibling(X,Y), male(Y).
sister(X,Y) :- sibling(X,Y), female(Y).

%Grandparent predicates
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
grandFather(X,Y) :- grandparent(X,Y), male(X).
grandMother(X,Y) :- grandparent(X,Y), female(X).

%Grandchild predicates
grandChild(X,Y) :- grandparent(Y,X).
grandson(X,Y) :- grandChild(X,Y), male(X).
granddaughter(X,Y) :- grandChild(X,Y), female(X).

%Uncle/Aunt predicates
parents_siblings(X,Y) :- sibling(Z,X), parent(Z,Y).
uncle(X,Y) :- parents_siblings(X,Y), male(X).
aunt(X,Y) :- parents_siblings(X,Y), female(X).

%Nephew predicates
nibling(X,Y) :- parents_siblings(Y,X).
nephew(X,Y) :- nibling(X,Y) , male(X) ; female(X).
%nephew(X,Y) :- nibling(X,Y) , female(X).

