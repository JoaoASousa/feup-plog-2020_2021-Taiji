% Writes game symbol stored in GameState on screen
write_char(clear) :- write('  ').
write_char(white) :- write('w ').
write_char(black) :- write('b ').

% Top Number Row (Numbers correspond to the correspondent ASCII decimal value)
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
write_char(58) :- write('X ').

% Left Side Letter Column (Numbers correspond to the correspondent ASCII decimal value)
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

% ---------------------------------------------------------------

% writes each character of the list (line). If id is 0, its either the column index line, or its a normal line past the column index. 
% Otherwise, its the Id'th element of the row indexing
% write_line(+Line, +Id) :-
write_line([], _).
write_line([Head|Tail], 0) :-
    write_char(Head),
    write('| '),
    write_line(Tail, 0).
write_line(Line, Id) :-
    LetterId is Id + 64,
    write_char(LetterId),
    write('| '),
    write_line(Line, 0).

% writes each line of the board by calling the write_line function multiple times; If its the first line, writes the index of columns
% write_board(+Board, +IsFirstLine)
write_board(Board) :-
    write_board(Board, 0).

write_board([], _).
write_board(Board, 0) :-
    write('| '),
    length(Board, Length), get_top_number_row(Length + 1, Indexes),
    write_line(Indexes, 0), nl,
    write_board(Board, 1).
write_board([Head|Tail], CurrLine) :-
    write('| '),
    write_line(Head, CurrLine), nl,
    write_board(Tail, CurrLine + 1).

% Returns top number row with given length
get_top_number_row(N, L):-
    N > 0, N =< 12,
    trim([clear,48,49,50,51,52,53,54,55,56,57,58], N, L).

% ---------------------------------------------------------------

% Displays the menu where the user chooses the size of the board
write_board_size_menu :-
    horizontal_line, nl,
    write(  '       Choose your desired board size      '), nl, nl,
    write(  '               1.  7  x  7                 '), nl,
    write(  '               2.  9  x  9                 '), nl,
    write(  '               3.  11 x 11                 '), nl,
    horizontal_line, nl.

% Displays the menu where the user chooses the "mode" to play
write_mode_pvp_ai_menu :-
    horizontal_line, nl,
    write(  '       Choose your desired mode      '), nl, nl,
    write(  '          1.  Player vs Player        '), nl,
    write(  '          2.  Player vs AI            '), nl,
    write(  '          3.  AI vs AI (???)          '), nl,
    horizontal_line, nl.

% ---------------------------------------------------------------

% Displays the menu where the user chooses the difficulty of the AI
write_difficulty_ai_menu :-
    horizontal_line, nl,
    write(  '       Choose the AI\'s difficulty    '), nl, nl,
    write(  '          1.  Random                  '), nl,
    write(  '          2.  Greedy                  '), nl,
    horizontal_line, nl.

% ---------------------------------------------------------------

% Writes to screen visual representation of the 4 Taijitu orientations
show_orientations :-
    write('    (1)                    (2)      '), nl,
    write('  [white, black]  [black, white]    '), nl, nl,
    write('    (3)                    (4)      '), nl,
    write('  [white,                [black,    '), nl,
    write('   black]                 white]    '), nl.


% ---------------------------------------------------------------

% predicate that returns the inital board state
initial(N, GameState) :-
    % nl, write('Initial State Board'),
    nl,
    initial_board(N, GameState).

% predicate that returns the intermediate board state
intermediate(GameState) :-
    nl, write('Intermediate State Board'), nl,
    intermediate_board(GameState).

% predicate that returns the end board state
end(GameState) :-
    nl, write('End State Board'), nl,
    end_board(GameState).

% Writes on screen entity assigned to color (0 is computer, 1 is Player1, 2 is Player2)
% PVE
write_white(0) :- write('The Computer (White)').
write_white(1) :- write('Player1 (White)').
write_white(2) :- write('Player2 (White)').
write_black(0) :- write('The Computer (Black)').
write_black(1) :- write('Player1 (Black)').
write_black(2) :- write('Player2 (Black)').

% Board Visualization Predicate
display_game(GameState, Player, w) :-
    write_board(GameState), nl,
    write_white(Player), nl.

display_game(GameState, Player, 1) :-
    write_board(GameState), nl,
    write_black(Player), nl.

