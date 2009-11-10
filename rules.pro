:- module(rules, [s/1]).

s(s(NP,VP)) --> np(NP), vp(VP).
np(np(Det,N,Rel)) --> det(Det), n(N), optrel(Rel).
np(np(PN)) --> pn(PN).
vp(vp(TV,NP)) --> tv(TV), np(NP).
vp(vp(IV)) --> iv(IV).
optrel(rel(epsilon)) --> [].
optrel(rel(that,VP)) --> [that], vp(VP).


