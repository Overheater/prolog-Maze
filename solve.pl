% These rules are incomplete, that is there are missing rules, and
% missing parts to the rules.  They are provided to illustrate
% the approach.

% Try a move in an "Up" direction, assumes Row and Column are bound.
try(Row, Column, NextRow, NextColumn) :- NextRow is Row, NextColumn is Column - 1.
% Try a move in an "down" direction, assumes Row and Column are bound.
try(Row, Column, NextRow, NextColumn) :- NextRow is Row, NextColumn is Column + 1.
% Try a move in an "left" direction, assumes Row and Column are bound.
try(Row, Column, NextRow, NextColumn) :- NextRow is Row - 1, NextColumn is Column.
% Try a move in an "right" direction, assumes Row and Column are bound.
try(Row, Column, NextRow, NextColumn) :- NextRow is Row + 1, NextColumn is Column.

% move(Maze, List, NewList, Row, Column, GoalRow, GoalColumn) - moves, 
%   and keep on moving until the GoalRow and GoalColumn coordinates 
%   are reached. List is the list of previous moves (important to check 
%   that the current move is not one previously made), NewList will be 
%   bound to the list of successful moves in a solved maze.

%
%   Recursive case still needed.

% printCell(Maze, List, Row, Column) - helper goal for printMaze, printCell
%   prints a single cell in the maze.
%
%   Print a barrier.
% prints the top and bottom of the the maze, a helper function for the print maze function
%solve(Maze) :- 

printList(List):-
printerate(List).

printBox(_width):-
write('+'),
forall(between(1,_width,_),
	write('-')),
writeln('+').
 
print_row_short(Maze, Row) :-
    mazeSize(Maze, _Rows, Columns),
	write('|'),
    forall(between(1, Columns, Column),
           printCell(Maze, _, Row, Column)),
    writeln('|').
	
	
printMaze(Maze, List) :-
    mazeSize(Maze, Rows, _Columns),
	printBox(_Columns),
    forall(between(1, Rows, Row),
           print_row_short(Maze, Row)),
	printBox(_Columns).
	
	
printCell(Maze, _, Row, Column) :- maze(Maze, Row, Column, barrier), write('x').
printCell(Maze, _, Row, Column) :- maze(Maze, Row, Column, open), write(' ').
printCell(Maze, _, Row, Column) :- maze(Maze, Row, Column, trail), write('*').
checkCell(Maze,List,Row,Column) :- iterate(List,Row,Column).
printerate([]).
printerate([H|T]):-writeln(H),printerate(T).
iterate([],Row,Column).
iterate([H|T],Row,Column) :- check(H,Row,Column),iterate(T).
check([],Row,Column).
check(H,Row,Column) :-member([Row,Column],H), write('*').

%printMaze(Maze, List) ;- true.

%solve(Maze) :- true.
