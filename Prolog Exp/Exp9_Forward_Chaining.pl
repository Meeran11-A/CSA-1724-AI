% Experiment 9: Forward Chaining
% SWISH: https://swish.swi-prolog.org/
%
% Forward chaining starts with known facts and repeatedly applies
% rules to infer new facts until no more rules can be applied.

% Initial facts
fact(has_wings).
fact(has_feathers).

% Rules: rule(Conclusion, ListOfRequiredPremises).
rule(bird, [has_wings, has_feathers]).
rule(animal, [bird]).
rule(can_fly, [bird, has_wings]).

% Check whether every premise is present in the current fact list.
all_present([], _).
all_present([H|T], Facts) :-
    member(H, Facts),
    all_present(T, Facts).

% Apply one rule to infer one new fact.
derive_one(Facts, NewFacts) :-
    rule(Conclusion, Premises),
    all_present(Premises, Facts),
    \+ member(Conclusion, Facts),
    append(Facts, [Conclusion], NewFacts).

% Continue applying rules until no new fact can be derived.
forward_chain(Facts, FinalFacts) :-
    (   derive_one(Facts, UpdatedFacts)
    ->  forward_chain(UpdatedFacts, FinalFacts)
    ;   FinalFacts = Facts
    ).

% Run forward chaining from all initial facts.
run_forward_chaining :-
    findall(F, fact(F), InitialFacts),
    forward_chain(InitialFacts, FinalFacts),
    write('Initial facts: '),
    writeln(InitialFacts),
    write('Facts after forward chaining: '),
    writeln(FinalFacts).

% Sample query (run in SWISH):
% ?- run_forward_chaining.
%
% You can also query an individual inferred fact:
% ?- forward_chain([has_wings, has_feathers], Facts), member(bird, Facts).
