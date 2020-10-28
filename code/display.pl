% custom write for each of the possibilities
write_char(clear) :- write('  ').
write_char(white) :- write('w').
write_char(black) :- write('b').

write_char(48) :- write('0 ').
write_char(49) :- write('1 ').
write_char(50) :- write('2 ').
write_char(51) :- write('3 ').
write_char(52) :- write('4 ').
write_char(53) :- write('5 ').
write_char(54) :- write('6 ').
write_char(55) :- write('7 ').
write_char(56) :- write('8 ').
write_char(57) :- write('9 ').
write_char(58) :- write('10').

write_char(65) :- write('A ').
write_char(66) :- write('B ').
write_char(67) :- write('C ').
write_char(68) :- write('D ').
write_char(69) :- write('E ').
write_char(70) :- write('F ').
write_char(71) :- write('G ').
write_char(72) :- write('H ').
write_char(73) :- write('I ').
write_char(74) :- write('J ').
write_char(75) :- write('K ').


% base case of a line of the board
write_line([]).

write_line([Head|Tail]) :-
    % translation(Head, CHAR),
    write_char(Head),
    write('| '),
    write_line(Tail).

% base case of the board
write_board([]).

write_board([Head|Tail]) :-
    write('| '),
    write_line(Head), nl,
    write_board(Tail).

% write_full_board([Head|Tail]) :-
%     % write(' | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10|'), nl,
%     write_board([Head|Tail]).



% predicate that returns the inital board state
initial(GameState) :-
    nl, write('Initial State Board'), nl,
    initial_board(GameState).

% predicate that returns the intermediate board state
intermediate(GameState) :-
    nl, write('Intermediate State Board'), nl,
    intermediate_board(GameState).

% predicate that returns the end board state
end(GameState) :-
    nl, write('End State Board'), nl,
    end_board(GameState).