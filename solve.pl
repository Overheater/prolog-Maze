% These rules are incomplete, that is there are missing rules, and
% missing parts to the rules.  They are provided to illustrate
% the approach.

% Try a move in an "Up" direction, assumes Row and Column are bound.
try(Row, Column, NextRow, NextColumn) :- NextRow is Row, NextColumn is Column - 1.

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
getChar(open, ' ').
getChar(barrier, 'x').

printBox(width):-
write('+'),
forall(between(1,width,_),write('-')),
writeln('+').

printMaze(array, size) :-
    mazeSize(size, Height, Width),
    printBox(Width),
    % for each line of the maze    
    forall(between(1, Height, I),
           (   write('|'),
               % for each cell of the line
               forall(between(1, Width, J),
                          % What is the type of the corresponding cell
                      (   maze(_, I, J, Type),
                          % What is the character of the type
                          getChar(Type, C),
                          write(C))),
               writeln('|'))),
    print_line(Width).
%printCell(Maze, _, Row, Column) :- maze(Maze, Row, Column, barrier), write('x').

%printMaze(Maze, List) ;- true.

%solve(Maze) :- true.
