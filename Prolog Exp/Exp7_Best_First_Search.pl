% Experiment 7: Best First Search Algorithm
% SWISH: https://swish.swi-prolog.org/
%
% Directed graph edges and heuristic values.
% The algorithm expands the frontier path whose last node has
% the smallest heuristic value (Greedy Best-First Search).

edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).
edge(e, h).
edge(f, h).
edge(g, h).

heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 4).
heuristic(d, 5).
heuristic(e, 3).
heuristic(f, 2).
heuristic(g, 3).
heuristic(h, 0).

% best_first(Start, Goal, Path).
best_first(Start, Goal, Path) :-
    best_first_search([[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

best_first_search([[Goal|Rest]|_], Goal, [Goal|Rest]).

best_first_search([CurrentPath|OtherPaths], Goal, Solution) :-
    CurrentPath = [Current|_],
    findall([Next|CurrentPath],
            (edge(Current, Next), \+ member(Next, CurrentPath)),
            NewPaths),
    append(OtherPaths, NewPaths, AllPaths),
    sort_paths(AllPaths, SortedPaths),
    best_first_search(SortedPaths, Goal, Solution).

best_first_search([], _, _) :-
    fail.

sort_paths(Paths, SortedPaths) :-
    findall(Heuristic-Path,
            (member(Path, Paths),
             Path = [Node|_],
             heuristic(Node, Heuristic)),
            KeyedPaths),
    keysort(KeyedPaths, SortedKeyedPaths),
    extract_paths(SortedKeyedPaths, SortedPaths).

extract_paths([], []).
extract_paths([_-Path|Rest], [Path|Paths]) :-
    extract_paths(Rest, Paths).

% Sample queries (run one at a time in SWISH):
% ?- best_first(a, h, Path).
% Expected: Path = [a,c,f,h].
%
% ?- best_first(a, d, Path).
% ?- best_first(a, g, Path).
