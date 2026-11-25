% Experiment 4: Dieting System Based on Disease
% SWISH: https://swish.swi-prolog.org/
%
% Educational sample knowledge base.
% These are general food suggestions, not medical advice or a prescribed diet.

% diet(Disease, FoodSuggestion).

diet(diabetes, 'Choose high-fibre foods, whole grains, vegetables, and controlled portions.').
diet(hypertension, 'Choose fruits and vegetables and reduce high-salt processed foods.').
diet(anemia, 'Include iron-containing foods such as beans and leafy greens, along with vitamin-C-rich foods.').
diet(obesity, 'Prefer balanced meals with vegetables, whole grains, and suitable portion sizes.').
diet(heart_disease, 'Choose a balanced diet with vegetables, fruits, whole grains, and lower saturated fat.').

% Rule to suggest a diet for a known disease.
suggest_diet(Disease) :-
    diet(Disease, Suggestion),
    format('Diet suggestion for ~w: ~w~n', [Disease, Suggestion]).

% Rule to handle diseases not present in the knowledge base.
suggest_diet(Disease) :-
    \+ diet(Disease, _),
    format('Sorry, no diet suggestion is available for ~w.~n', [Disease]).

% Sample queries (run one at a time in SWISH):
% ?- suggest_diet(diabetes).
% ?- suggest_diet(hypertension).
% ?- suggest_diet(anemia).
% ?- suggest_diet(obesity).
% ?- suggest_diet(asthma).
%
% Query all available disease-diet pairs:
% ?- diet(Disease, Suggestion).
