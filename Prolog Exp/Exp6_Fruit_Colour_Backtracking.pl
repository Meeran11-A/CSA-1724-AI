% Experiment 6: Fruit and its Colour Using Backtracking
% Compatible with SWISH (SWI-Prolog)

fruit_colour(apple, red).
fruit_colour(banana, yellow).
fruit_colour(grapes, green).
fruit_colour(orange, orange).
fruit_colour(mango, yellow).
fruit_colour(strawberry, red).
fruit_colour(guava, green).
fruit_colour(blueberry, blue).

% Display every fruit-colour pair using backtracking.
show_all_fruits :-
    fruit_colour(Fruit, Colour),
    format('~w is ~w~n', [Fruit, Colour]),
    fail.
show_all_fruits.

% Sample queries (enter one at a time in SWISH):
% fruit_colour(apple, Colour).
% fruit_colour(Fruit, yellow).
% fruit_colour(Fruit, Colour).
% show_all_fruits.
