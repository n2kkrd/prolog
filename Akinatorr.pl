:- dynamic ������/2, ���������/2, ��������/2, �������/2, ��������/2, ����������������/2, ���/2, �������/2, ����9/2.

game:- see('iz7.txt'), get_person, seen,question1(Answer1), question2(Answer2), question3(Answer3),question4(Answer4),question5(Answer5), question6(Answer6), question7(Answer7),question8(Answer8),question9(Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8,Answer9),check_answers(Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8,Answer9),!.

% �������������� � ������� � swi
write_list([]):-!.
write_list([H|T]):- write(H), write(" "), write_list(T).

write_str([]):-!.
write_str([H|T]):- write(H), write_str(T).

read_str(A):-get0(X),get0(X1),r_str(X1,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

get_person:- readln(Character), Character \= [], readln(��������), ��������(Character, ��������),get_person.
get_person:-!.

��������(_, []):- !.
��������(��������, [H|T]):- asserta(������(��������, H)), ���(��������, T).

���(_, []):- !.
���(��������, [H|T]):- asserta(���������(��������, H)), ������(��������, T),!.

������(_,[]):- !.
������(��������,[H|T]):- asserta(��������(��������,H)), ���(��������, T),!.

���(_, []):- !.
���(��������, [H|T]):- asserta(�������(��������, H)), �������(��������, T),!.

�������(_, []):-!.
�������(��������, [H|T]):- asserta(��������(��������,H)), �����(��������, T), !.

�����(_,[]):-!.
�����(��������, [H|T]):- asserta(����������������(��������, H)), pol(��������, T),!.

pol(_,[]):-!.
pol(��������, [H|T]):- asserta(���(��������,H)), side(��������, T),!.

side(_, []):- !.
side(��������,[H|T]):- asserta(�������(��������, H)), �9(��������, T),!.
