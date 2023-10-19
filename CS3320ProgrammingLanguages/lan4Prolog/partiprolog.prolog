tpa(S, L, R) :-
get_time(St),
write("\tStart time: \t"), write(St), nl,
partition(S, L, R),
get_time(Et),
write("\tEnd time: \t"), write(Et), nl,
Ft is Et-St,
write("\tFinish Time: \t"), writeln(Ft)->true.

helper([],[],[],0,0).  

helper([X|XS],[X|L],R,SUML,SUMR):-helper(XS,L,R,SUMN,SUMR),SUML is SUMN+X. 

helper([X|XS],L,[X|R],SUML,SUMR):-helper(XS,L,R,SUML,SUMN),SUMR is SUMN+X.

partition(S,L,R):-helper(S,L,R,X,X).