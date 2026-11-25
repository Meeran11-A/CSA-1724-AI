% Experiment 10: Backward Chaining
% SWISH: https://swish.swi-prolog.org/
%
% Backward chaining starts with a goal and works backwards to check
% whether the goal can be proved from known facts and rules.

% Known facts
fact(has_wings).
fact(has_feathers).

% Rules: rule(Conclusion, ListOfRequiredPremises).
rule(bird, [has_wings, has_feathers]).
rule(animal, [bird]).
rule(can_fly, [bird, has_wings]).

% prove(Goal) succeeds if Goal is a known fact or can be inferred
% by proving all premises of a rule whose conclusion is Goal.
prove(Goal) :-
    fact(Goal).

prove(Goal) :-
    rule(Goal, Premises),
    prove_all(Premises).

% Prove every goal in a list of premises.
prove_all([]).

prove_all([Goal|Rest]) :-
    prove(Goal),
    prove_all(Rest).

% Display the result for a goal.
check_goal(Goal) :-
    (   prove(Goal)
    ->  format('Goal ~w is proved.~n', [Goal])
    ;   format('Goal ~w cannot be proved.~n', [Goal])
    ).

% Sample queries (run one at a time in SWISH):
% ?- check_goal(can_fly).
% Expected: Goal can_fly is proved.
%
% ?- check_goal(bird).
% Expected: Goal bird is proved.
%
% ?- check_goal(animal).
% Expected: Goal animal is proved.
%
% ?- check_goal(has_wheels).
% Expected: Goal has_wheels cannot be proved.
%
% Direct query:
% ?- prove(can_fly).
