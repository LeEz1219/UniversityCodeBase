
tquicksort(X, Y) :-
  get_time(St),
  write("\tStart time: \t"), write(St), nl,
  quicksort(X, Y),
  get_time(Et),
  write("\tEnd time: \t"), write(Et), nl,
  Ft is Et-St,
  write("\tFinish Time: \t"), writeln(Ft)->true.

quicksort([X|Xs],Ys) :-
  partition(Xs,X,Left,Right),
  quicksort(Left,Ls),
  quicksort(Right,Rs),
  append(Ls,[X|Rs],Ys).
quicksort([],[]).

partition([X|Xs],Y,[X|Ls],Rs) :-
  X =< Y, partition(Xs,Y,Ls,Rs).
partition([X|Xs],Y,Ls,[X|Rs]) :-
  X > Y, partition(Xs,Y,Ls,Rs).
partition([],Y,[],[]).

append([],Ys,Ys).
append([X|Xs],Ys,[X|Zs]) :- append(Xs,Ys,Zs).
