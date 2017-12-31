Top level predicates ::
istransitive(S,L):-
 This predicate accepts S, the set on which the relation is defined and L, the relation which we are checking for transitivity.
 This is based on the fact that a relation is not transitive if (a,b),(b,c) is present in the list and (a,c) is not present,
 it is possible that the element (a,c) can occur before the elements (a,b),(b,c) order, hence we need to check for its existence in the 
 reverse order. Hence if either of the cases is true, we return true else false.
 
 Query format for the above predicate:-
 istransitive(S,L), Sample (S,L) = ([0,1],[[0,1],[1,2],[1,1]]).


findtransitiveclosure(S,L):-
 This predicate finds the transitive closure of the relation on a set which are passed as arguments. First, it calls printelements(L), whose function is to print the elements of the relation L since transitive closure is the smallest set which contains L and is transitive. Further, it calls query(L) which computes the elements to be added to the original relation to make it transitive. This predicate functions by computing the element which it first finds to be present in the transitive closure, then adds it to the previous relation to find a new relation and again calls itself to compute further elements and the process continues until no further elements are to be computed, and then to avoid backtracking, we stop the predicate. This predicate works in sync with the closure predicate which finds elements required to be present in a given relation passed to it. 
 
 Query format for the above predicate:-
 findtransitiveclosure(S,L), Sample (S,L) = ([0,1],[[0,1],[1,2],[1,1]]).
