% --- Task 4.1 ---
/*Отсечение в данной процедуре является красным.

Пример цели:
member(3, [1, 2, 3, 4]).

Без отсечения:
Решение: true
Решение: true
Решение: true
Решение: false

С отсечением:
Решение: true*/

% --- Task 4.2 ---

fib(1, 1):- !.
fib(2, 1):- !.
fib(N, F):- N > 2, N1 is N - 1, N2 is N - 2, fib(N1, F1), fib(N2, F2), F is F1 + F2.

% --- Task 4.3.1 ---

shellsort(List, Sorted):-
    length(List, N),
    shellsort(List, N, Sorted).

shellsort(List, N, Sorted):-
    D is N // 2,
    (D =< 0 -> Sorted = List ;
        shellsort(List, D, Dsorted),
        knuth(Dsorted, D, Sorted)
    ).

knuth(List, D, Sorted):-
    length(List, N),
    knuth(List, N, D, Sorted).

knuth(List, N, D, Sorted):-
    (D =< 0 -> Sorted = List ;
        partition(List, N, D, D, 1, First, Rest),
        knuth(First, D, FSorted),
        knuth(Rest, N - D, D, RSorted),
        merge(FSorted, RSorted, D, Sorted)
     ).

partition(List, N, D, I, I, [], List):- I + D > N, !.
partition([X|Xs], N, D, I, J, [X|Jsones], Rest):-
    J is I + D,
    partition(Xs, N, D, I, J, Jsones, Rest).

merge([], L, _, L):-!.
merge(L, [], _, L):-!.
merge([X|Xs], [Y|Ys], D, [X|Zs]):-
    X @=< Y,!,
    merge(Xs, [Y|Ys], D, Zs).
merge([X|Xs], [Y|Ys], D, [Y|Zs]):-
    merge([X|Xs], Ys, D, Zs).

% --- Task 4.3.2 ---

sort_shell :- 
    write('list? '), 
    read(List), 
    shellsort(List, Sorted), 
    write('answer: '), 
    write(Sorted).


% --- Task 4.4.1 ---

min(X,Y,X):-X=<Y.
min(X,Y,Y):-X>Y.

remove(_, [], []).
remove(X, [X|T], T1):-remove(X, T, T1).
remove(X, [H|T], [H|T1]):-X\=H, remove(X, T, T1).

sort_4_1([], []).
sort_4_1(List, [M|Sorted]):-min(M, List, _), remove(M, List, L1), sort_4_1(L1, Sorted).

sort_4_1 :-
    write('list? '), 
    read(List),
    sort_4_1(List, Sorted), 
    write('answer: '), 
    write(Sorted).

% --- Task 4.4.2 ---

sort_4_2 :-
    write('list? '), 
    read(List), 
    sort_4_2(List, Sorted), 
    write('answer: '), 
    write(Sorted).
  
b_sort([], Acc, Acc).
b_sort([X|T], Acc, Sorted) :- bubble(X, T, NT, Max), b_sort(NT, [Max|Acc], Sorted).
  
bubble(X, [], [], X).
bubble(X, [Y|T], [Y|NT], Max) :- X > Y, bubble(X, T, NT, Max).
bubble(X, [Y|T], [X|NT], Max) :- X =< Y, bubble(Y, T, NT, Max).

sort_4_2(List, Sorted) :- b_sort(List, [], Sorted).

