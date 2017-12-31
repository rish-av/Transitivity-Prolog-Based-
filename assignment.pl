istransitive(S,L):-
	not((memberof([A,B],L),memberof([B,C],L),not(memberof([A,C],L)))),!; %a relation is not transitive if it has (a,b) (b,c) but not 																								(a,c).This returns the negation of this statement.
	not((memberof([B,A],L),memberof([C,B],L),not(memberof([C,A],L)))),!. %this statement is there to ensure that if the transitive element is 																						       somewhere behind then also it is checked

closure(X, Y, L) :- %closure gives the elements (X,Y) such that (X,Z) and (Z,Y) are originally in the relation L given that X!=Z and Z!=Y. 
(memberof([X, Z], L), memberof([Z, Y],L), X\==Z, Z\==Y).  

query(L):- %query fuction gives all the elements other than the relation itself which make it transitive.
(closure(Z,W,L);!),
\+memberof([Z,W],L),
concat([[Z,W]],L,TR),
write('('),write(Z),write(','),write(W),write(')'), nl,
(query(TR);!),fail.

printelements(L):- %print function to print the elememts of the relation (since closure by default contains the relation).
memberof([X,Y],L),
write('('),write(X),write(','),write(Y),write(')'), nl,fail.

findtransitiveclosure(S,L):- %finally printing the transitive closure.
(printelements(L);true),
query(L).

memberof(X,[X|T]). %to check if the element X exists in the set or not
 memberof(X,[_|T]):-
 memberof(X,T).
 
concat([],X,X).    %concatenates two lists to produce a third list.                  
concat([X|Y],Z,[X|W]) :- concat(Y,Z,W). 
