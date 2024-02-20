% --- Task 1 ---

% факты про отрезки
% point(x, y)
seg(1, point(1, 11), point(14, 11)).
seg(2, point(2, 4), point(13, 4)).
seg(3, point(2, 2), point(9, 2)).
seg(4, point(3, 1), point(3, 10)).
seg(5, point(7, 10), point(13, 10)).
seg(6, point(8, 0), point(8, 13)).
seg(7, point(10, 3), point(10, 12)).
seg(8, point(11, 3), point(11, 13)).
seg(9, point(12, 2), point(12, 12)).

% правило для определения номера горизонтального отрезка
horiz(N) :- seg(N, point(X1, Y), point(X2, Y)), X1 < X2.

% правило для определения номера вертикального отрезка
vertical(N) :- seg(N, point(X, Y1), point(X, Y2)), Y1 < Y2.

% Задание 2

linelength(N, L) :- 
  seg(N, point(X1, Y1), point(X2, Y2)),
  sqrt((X2 - X1) * (X2 - X1) + (Y2 - Y1) * (Y2 - Y1), L).

cross(N, M, point(X, Y), NL, ML) :-
    seg(N, point(X1, Y), point(X2, Y)),
    seg(M, point(X, Y1), point(X, Y2)),
    between(Y1, Y2, Y),
    between(X1, X2, X),
    linelength(N, NL),
    linelength(M, ML).

% Задание 3

perimetr(A, B, C, D, P, S) :-
  seg(A, point(X11, Y11), point(X12, Y12)),
  seg(B, point(X21, Y21), point(X22, Y22)),
  seg(C, point(X31, Y31), point(X32, Y32)),
  seg(D, point(X41, Y41), point(X42, Y42)),
  A \= B, A \= C, A \= D,
  B \= C, B \= D,
  C \= D,
  X11 > X31, Y21 > Y41, 
  vertical(A), horiz(B), vertical(C), horiz(D),
  cross(B, A, point(XBA, YBA), _, _),
  cross(B, C, point(XBC, YBC), _, _),
  cross(D, A, point(XDA, YDA), _, _),
  cross(D, C, point(XDC, YDC), _, _),
  PA is abs(YBA - YDA),
  PB is abs(XBC - XBA),
  P is 2 * PA + 2 * PB,
  S is PA * PB.