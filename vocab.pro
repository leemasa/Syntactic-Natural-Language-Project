:- use_module('rules.pro').

%vocab list
pn(pn(terry)) --> [terry].
pn(pn(shrdlu)) --> [shrdlu].
pn(pn(fred)) --> [fred].

iv(iv(halts)) --> [halts].
iv(iv(dies)) --> [dies].
iv(iv(sleeps)) --> [sleeps].

tv(tv(writes)) --> [writes].

det(det(a)) -->   [a].
det(det(the)) --> [the].

n(n(program)) --> [program].
