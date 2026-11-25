% Experiment 1: Towers of Hanoi
% SWISH: https://swish.swi-prolog.org/
%
% Program:
% hanoi(N, Source, Destination, Auxiliary)
% prints the moves needed to transfer N disks from Source to Destination.

hanoi(1, Source, Destination, _) :-
    format('Move disk from ~w to ~w~n', [Source, Destination]).

hanoi(N, Source, Destination, Auxiliary) :-
    N > 1,
    N1 is N - 1,
    hanoi(N1, Source, Auxiliary, Destination),
    hanoi(1, Source, Destination, Auxiliary),
    hanoi(N1, Auxiliary, Destination, Source).

% Sample query (enter this in the SWISH query box):
% ?- hanoi(3, left, right, middle).
%
% Expected output:
% Move disk from left to right
% Move disk from left to middle
% Move disk from right to middle
% Move disk from left to right
% Move disk from middle to left
% Move disk from middle to right
% Move disk from left to right
