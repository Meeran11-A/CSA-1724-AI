% Experiment 8: Medical Diagnosis System
% SWISH: https://swish.swi-prolog.org/
%
% This is a simple educational expert-system example.
% It is NOT a real medical diagnostic tool.

% Symptom facts for sample patients.
has_symptom(patient1, fever).
has_symptom(patient1, cough).
has_symptom(patient1, body_pain).

has_symptom(patient2, sneezing).
has_symptom(patient2, runny_nose).
has_symptom(patient2, sore_throat).

has_symptom(patient3, fever).
has_symptom(patient3, rash).

% Diagnosis rules based on combinations of symptoms.
diagnosis(Patient, flu_like_illness) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, cough),
    has_symptom(Patient, body_pain).

diagnosis(Patient, common_cold_like_illness) :-
    has_symptom(Patient, sneezing),
    has_symptom(Patient, runny_nose),
    has_symptom(Patient, sore_throat).

diagnosis(Patient, fever_with_rash) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, rash).

% Display the possible rule-based result for a patient.
diagnose(Patient) :-
    diagnosis(Patient, Condition),
    format('~w: possible ~w (educational example only).~n',
           [Patient, Condition]).

% Message when no rule matches.
diagnose(Patient) :-
    \+ diagnosis(Patient, _),
    format('No matching rule found for ~w.~n', [Patient]).

% Sample queries (run one at a time in SWISH):
% ?- diagnose(patient1).
% ?- diagnose(patient2).
% ?- diagnose(patient3).
% ?- diagnosis(patient1, Result).
% ?- has_symptom(patient1, Symptom).
