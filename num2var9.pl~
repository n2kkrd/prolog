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
