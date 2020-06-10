:- dynamic откуда/2, рукопашка/2, характер/2, команда/2, сущность/2, сверхспособность/2, пол/2, сторона/2, вопр9/2.

game:- see('iz7.txt'), get_person, seen,question1(Answer1), question2(Answer2), question3(Answer3),question4(Answer4),question5(Answer5), question6(Answer6), question7(Answer7),question8(Answer8),question9(Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8,Answer9),check_answers(Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8,Answer9),!.

% Взаимодействие с файлами и swi
write_list([]):-!.
write_list([H|T]):- write(H), write(" "), write_list(T).

write_str([]):-!.
write_str([H|T]):- write(H), write_str(T).

read_str(A):-get0(X),get0(X1),r_str(X1,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

get_person:- readln(Character), Character \= [], readln(Сведения), персонаж(Character, Сведения),get_person.
get_person:-!.

персонаж(_, []):- !.
персонаж(Персонаж, [H|T]):- asserta(откуда(Персонаж, H)), бой(Персонаж, T).

бой(_, []):- !.
бой(Персонаж, [H|T]):- asserta(рукопашка(Персонаж, H)), характ(Персонаж, T),!.

характ(_,[]):- !.
характ(Персонаж,[H|T]):- asserta(характер(Персонаж,H)), тим(Персонаж, T),!.

тим(_, []):- !.
тим(Персонаж, [H|T]):- asserta(команда(Персонаж, H)), человек(Персонаж, T),!.

человек(_, []):-!.
человек(Персонаж, [H|T]):- asserta(сущность(Персонаж,H)), сверх(Персонаж, T), !.

сверх(_,[]):-!.
сверх(Персонаж, [H|T]):- asserta(сверхспособность(Персонаж, H)), pol(Персонаж, T),!.

pol(_,[]):-!.
pol(Персонаж, [H|T]):- asserta(пол(Персонаж,H)), side(Персонаж, T),!.

side(_, []):- !.
side(Персонаж,[H|T]):- asserta(сторона(Персонаж, H)), в9(Персонаж, T),!.
