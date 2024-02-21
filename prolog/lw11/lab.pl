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
split([H|T], [H|L2], L3) :- 
    0 is H mod 2, 
    split(T, L2, L3).
split([H|T], L2, [H|L3]) :- 
    1 is H mod 2, 
    split(T, L2, L3).

% --- Task 7 ---

repeat3(L1, L2) :- 
    append([First | Middle], [Last], L1), 
    append([Last, Last, Last | Middle], [First, First, First], L2).

% --- Task 8 ---

combi([], L2, L2).
combi(L1, [], L1).
combi([H1|T1], [H2|T2], [H1,H2|T3]) :- 
    combi(T1, T2, T3).