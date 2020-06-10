r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,I,B):-I1 is I+1, read(X), append(B,[X],B1),r_list(A,N,I1,B1).

naib([],_):-!.
naib([H|T],M):-H>M, write(H),write(" "),naib(T,M).
naib([_|T],M):-naib(T,M).


sr_ar([],S,K,[H1|T1]):- Z is S/K,write(Z),write(" - Среднеее арифметическое"),nl, naib([H1|T1],Z),!.
sr_ar([H|T],S,K,[H1|T1]):- S1 is S+H, K1 is K+1, sr_ar(T,S1,K1,[H1|T1]).


ind2:-read(N),r_list(A,N),sr_ar(A,0,0,A).
