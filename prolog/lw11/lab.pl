% --- Task 1 ---

trim([_|T1], L2) :- 
    reverse(T1, [_|T2]), 
    reverse(T2,L2).

% --- Task 2 ---

first_last([H|T], L2) :- 
    append(Middle, [Last], T),
    append([Last | Middle], [H], L2).

% --- Task 3 ---


% --- Task 4 ---

