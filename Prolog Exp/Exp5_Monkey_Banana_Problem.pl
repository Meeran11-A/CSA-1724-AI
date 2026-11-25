% Experiment 5: Monkey Banana Problem
% SWISH: https://swish.swi-prolog.org/
%
% State representation:
% state(MonkeyPosition, MonkeyStatus, BoxPosition, HasBanana)
%
% Positions: door, middle, window
% MonkeyStatus: on_floor or on_box
% HasBanana: yes or no
%
% The monkey can:
% 1. Walk from one position to another.
% 2. Push the box when standing beside it (in this simplified model,
%    the monkey and box are at the same position before pushing).
% 3. Climb onto the box.
% 4. Grab the banana when standing on the box at the middle.

% move(CurrentState, Action, NextState).

% Monkey walks on the floor.
move(state(Pos, on_floor, Box, Has),
     walk(Pos, NewPos),
     state(NewPos, on_floor, Box, Has)) :-
    member(NewPos, [door, middle, window]),
    Pos \= NewPos.

% Monkey pushes the box to another position.
move(state(Pos, on_floor, Pos, Has),
     push(Pos, NewPos),
     state(NewPos, on_floor, NewPos, Has)) :-
    member(NewPos, [door, middle, window]),
    Pos \= NewPos.

% Monkey climbs onto the box.
move(state(Pos, on_floor, Pos, Has),
     climb,
     state(Pos, on_box, Pos, Has)).

% Monkey grabs the banana when on the box at the middle.
move(state(middle, on_box, middle, no),
     grab,
     state(middle, on_box, middle, yes)).

% Goal state: monkey has the banana.
goal(state(_, _, _, yes)).

% Solve the problem by searching through possible actions.
solve(State, Plan) :-
    solve(State, [State], Plan).

solve(State, _, []) :-
    goal(State).

solve(State, Visited, [Action|Rest]) :-
    move(State, Action, NextState),
    \\+ member(NextState, Visited),
    solve(NextState, [NextState|Visited], Rest).

% Sample query:
% ?- solve(state(door, on_floor, window, no), Plan).
%
% Expected result is a list of actions that moves the box to the middle,
% lets the monkey climb it, and grab the banana.
%
% Example possible plan:
% Plan = [walk(door,window), push(window,middle), climb, grab]
