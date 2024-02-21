% --- Task 1 ---

trim([_|T1], L2) :- 
    reverse(T1, [_|T2]), 
    reverse(T2,L2).

% --- Task 2 ---

first_last([H|T], L2) :- 
    append(Middle, [Last], T),
    append([Last | Middle], [H], L2).

% --- Task 3 ---

total([], 1). 
total([X|XS], P) :- 
    total(XS, P1), 
    P is X * P1.

% --- Task 4 ---

place(X, L, [X|L]).
place(X, [H|T], [H|L]) :- 
    place(X, T, L).

% --- Task 5 ---

double([], []).
double([H|T], [H, H | T2]) :- 
    double(T, T2).

% --- Task 6 ---

split([], [], []).
split([H|T], L2, [H|L3]) :- 
    0 is H mod 2, 
    split(T, L2, L3).
split([H|T], [H|L2], L3) :- 
    1 is H mod 2, 
    split(T, L2, L3).