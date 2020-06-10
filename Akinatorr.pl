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

�9(_,[]):-!.
�9(��������, [H|_]):- asserta(����9(��������, H)).
% �������
question1(Answer):-write('��� �������� � ������� �����?\n0. ��\n1. ���\n'), read(Answer).
question2(Answer):-write('\n\n������� �� ��� �������� ���������� ����?\n0. ��\n1. ���\n'), read(Answer).
question3(Answer):-write('\n\n� ������ ��������� ������� ��������?\n0. ��\n1. ���\n'), read(Answer).
question4(Answer):-write('\n\n� ����� ������� ����������� ��� ��������?\n0. ��������\n1. ������ ���������\n2. �� � �����\n'), read(Answer).
question5(Answer):-write('\n\n��� �������� �������?\n0. ��\n1.���\n'), read(Answer).
question6(Answer):-write('\n\n������ ������������������ �������?\n0. �� ����� �����������������\n1. �����������\n2. �����, ����������, �������, ���������\n3. ���\n4. ������( � �����-�� �������)\n5. ����� ���� �����������\n6. �������, ���������� ��������\n7.������� ������\n8. ����� �������������/�����������\n9. ��������\n10. ���\n11. �������������\n'), read(Answer).
question7(Answer):-write('\n\n��� ������ ���������?\n0. �������\n1. �������\n'), read(Answer).
question8(Answer):-write('\n\n�� ����� ������� ��� ��������?\n0. �����\n1. ���\n2. ������ ���������\n'), read(Answer).
question9(_,_,_,_,_,1,_,_,Answer):-write('\n\n� ������ ��������� ������ ������ ����?\n0. ��\n1. ���\n'), read(Answer).
question9(_,_,_,_,_,10,_,_,Answer):-write('\n\n��� �� ��� �������� � ������� ��������?\n0. ��\n1. ���\n'), read(Answer).
question9(1,_,0,_,_,3,_,_,Answer):-write('\n\n��� �������� �������� ������ ����?\n0. ��\n1. ���\n'), read(Answer).
question9(_,_,_,_,_,_,_,_,Answer):-write('\n\n��� �������� ������ � ������?\n0. ��\n1. ���\n'), read(Answer).
question9(_,_,_,_,_,6,_,_,Answer):-write('\n\n��� �������� �������� ����������?\n0. ��\n1. ���\n'), read(Answer).
add_character(0, List):-write('\n������� ��� ������ ��������� -- '), read_str(���), name(��������, ���), add_in_bd(��������, List),write('������ �������...'), !.
add_character(1,_):-!.
add_in_bd(CharName, List):- append('iz7.txt'), nl, write(CharName), nl, write_list(List), told.
check_answers(Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8,Answer9):- ������(Character,Answer1),���������(Character,Answer2),��������(Character,Answer3),�������(Character,Answer4),��������(Character,Answer5),����������������(Character,Answer6),���(Character,Answer7),�������(Character,Answer8),����9(Character,Answer9),write('��� ��������:   '),write_str(Character),clear_base.
check_answers(Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8,Answer9):-write('�������� �� ��� ������!!!!\n������ � ����:\n0. ��\n1. ���\n'), read(Answer),add_character(Answer,[Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8,Answer9]),clear_base.
clear_base:- �������_���������,�������_���������,�������_��������,�������_�������,�������_��������,�������_����������������,�������_���,�������_�������,�������_����9.
