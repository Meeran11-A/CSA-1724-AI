% Experiment 2: Check whether a particular bird can fly or not
% SWISH: https://swish.swi-prolog.org/
%
% Facts: known birds and their flying ability.

bird(sparrow).
bird(parrot).
bird(pigeon).
bird(crow).
bird(ostrich).
bird(penguin).
bird(kiwi).

can_fly(sparrow).
can_fly(parrot).
can_fly(pigeon).
can_fly(crow).

% A bird cannot fly if it is a known bird and is not listed as able to fly.
cannot_fly(Bird) :-
    bird(Bird),
    \+ can_fly(Bird).

% Print the result for a given bird.
check_bird(Bird) :-
    (   can_fly(Bird)
    ->  format('~w can fly.~n', [Bird])
    ;   cannot_fly(Bird)
    ->  format('~w cannot fly.~n', [Bird])
    ;   format('Information about ~w is not available.~n', [Bird])
    ).

% Required sample queries (run one at a time in SWISH):
% ?- check_bird(sparrow).
% Output: sparrow can fly.
%
% ?- check_bird(penguin).
% Output: penguin cannot fly.
%
% ?- check_bird(ostrich).
% Output: ostrich cannot fly.
%
% ?- can_fly(Bird).
% Backtracks through all birds that can fly.
%
% ?- cannot_fly(Bird).
% Backtracks through all known birds that cannot fly.
%
% ?- bird(Bird).
% Lists all birds in the knowledge base.
