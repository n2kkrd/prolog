ind1:-solve(3,3,Max_P,0,Max_count),write('p = '),write(Max_P),nl,write('Count of right Triangle = '),write(Max_count).


solve(1001,Max_P,Max_P,Max_count,Max_count):-!.
solve(P,_,Max_P,Cur_C,Max_count):-Z is P-2,split(P,1,1,Z,Number,0),Number>Cur_C,P1 is P+1,solve(P1,P,Max_P,Number,Max_count),!.
solve(P,Cur_P,Max_P,Cur_C,Max_count):-P1 is P+1, solve(P1,Cur_P,Max_P,Cur_C,Max_count).



split(P,A,_,_,Number,Number):- A is P div 3,!.
split(P,A,B,_,Number,Count):- B is (P-A) div 2, A1 is A + 1,B1 is A1,C1 is P-A1,
	(check_exist(A1,B1,C1),check_rightTriangle(A1,B1,C1)->Count1 is Count+1,
	split(P,A1,B1,C1,Number,Count1),!; split(P,A1,B1,C1,Number,Count),!).
split(P,A,B,_,Number,Count):- B1 is B+1, C1 is P - A -B1,
	(check_exist(A,B1,C1),check_rightTriangle(A,B1,C1) -> Count1 is Count +1,split(P,A,B1,C1,Number,Count1),!;split(P,A,B1,C1,Number,Count),!).

check_exist(A,B,C):- C < A + B.
check_rightTriangle(A,B,C):- C2 is C*C,A2 is A*A,B2 is B*B, C2 is A2 + B2.







r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,I,B):-I1 is I+1, read(X), append(B,[X],B1),r_list(A,N,I1,B1).

naib([],_):-!.
naib([H|T],M):-H>M, write(H),write(" "),naib(T,M).
naib([_|T],M):-naib(T,M).


sr_ar([],S,K,[H1|T1]):- Z is S/K,write(Z),write(" - Среднеее арифметическое"),nl, naib([H1|T1],Z),!.
sr_ar([H|T],S,K,[H1|T1]):- S1 is S+H, K1 is K+1, sr_ar(T,S1,K1,[H1|T1]).


ind2:-read(N),r_list(A,N),sr_ar(A,0,0,A).
