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

в9(_,[]):-!.
в9(Персонаж, [H|_]):- asserta(вопр9(Персонаж, H)).
% Вопросы
question1(Answer):-write('Ваш персонаж с планеты Земля?\n0. Да\n1. Нет\n'), read(Answer).
question2(Answer):-write('\n\nВладеет ли ваш персонаж рукопашным боем?\n0. Да\n1. Нет\n'), read(Answer).
question3(Answer):-write('\n\nУ вашего персонажа трудный характер?\n0. Да\n1. Нет\n'), read(Answer).
question4(Answer):-write('\n\nК какой команде принадлежит ваш персонаж?\n0. Мстители\n1. Стражи Галактики\n2. Ни к какой\n'), read(Answer).
question5(Answer):-write('\n\nВаш персонаж человек?\n0. Да\n1.Нет\n'), read(Answer).
question6(Answer):-write('\n\nКакими сверхспособностями владеет?\n0. Не имеет суперспособностей\n1. Суперсолдат\n2. Гений, миллиардер, плейбой, филантроп\n3. Бог\n4. Киборг( в какой-то степени)\n5. Имеет гены целлестиала\n6. Акробат, стреляющий паутиной\n7.Зеленый мутант\n8. Умеет увеличиваться/уменьшаться\n9. Пришелец\n10. Маг\n11. Суперскорость\n'), read(Answer).
question7(Answer):-write('\n\nПол вашего персонажа?\n0. Мужской\n1. Женский\n'), read(Answer).
question8(Answer):-write('\n\nНа какой стороне ваш персонаж?\n0. Добро\n1. Зло\n2. Скорее нейтрален\n'), read(Answer).
question9(_,_,_,_,_,1,_,_,Answer):-write('\n\nУ вашего персонажа протез вместо руки?\n0. Да\n1. Нет\n'), read(Answer).
question9(_,_,_,_,_,10,_,_,Answer):-write('\n\nБыл ли ваш персонаж в прошлом хирургом?\n0. Да\n1. Нет\n'), read(Answer).
question9(1,_,0,_,_,3,_,_,Answer):-write('\n\nВаш персонаж является братом Тора?\n0. Да\n1. Нет\n'), read(Answer).
question9(_,_,_,_,_,_,_,_,Answer):-write('\n\nВаш персонаж знаком с Грутом?\n0. Да\n1. Нет\n'), read(Answer).
question9(_,_,_,_,_,6,_,_,Answer):-write('\n\nВаш персонаж является подростком?\n0. Да\n1. Нет\n'), read(Answer).
add_character(0, List):-write('\nВведите имя вашего персонажа -- '), read_str(Имя), name(Персонаж, Имя), add_in_bd(Персонаж, List),write('Данные внесены...'), !.
add_character(1,_):-!.
add_in_bd(CharName, List):- append('iz7.txt'), nl, write(CharName), nl, write_list(List), told.
check_answers(Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8,Answer9):- откуда(Character,Answer1),рукопашка(Character,Answer2),характер(Character,Answer3),команда(Character,Answer4),сущность(Character,Answer5),сверхспособность(Character,Answer6),пол(Character,Answer7),сторона(Character,Answer8),вопр9(Character,Answer9),write('Ваш персонаж:   '),write_str(Character),clear_base.
check_answers(Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8,Answer9):-write('Персонаж не был найден!!!!\nВнести в базу:\n0. Да\n1. Нет\n'), read(Answer),add_character(Answer,[Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8,Answer9]),clear_base.
clear_base:- удалить_персонажа,удалить_рукопашка,удалить_характер,удалить_команда,удалить_сущность,удалить_сверхспособность,удалить_пол,удалить_сторона,удалить_вопр9.
