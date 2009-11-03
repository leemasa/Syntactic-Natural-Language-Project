noun(Fred).
verb(sleeps).
sentence(X,Y) :- subject(X), predicate(Y).
subject(X) :- noun(X).
predicate(X) :- verb(X).
?sentence(Fred,sleeps).
