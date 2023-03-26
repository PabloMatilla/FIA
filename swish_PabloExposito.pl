
% Some simple test Prolog programs
% --------------------------------

% Knowledge bases

at(agent, room1).
%at(agent, room2).
%at(key1, room1).
at(key1, room2).
at(key2, room2).
%state(door1, closed).
state(door1, open).
%state(key1, free).
%state(key2, free).
opens(key1, door1).
connects(door1, room1, room2).
%holds(agent, none).
holds(agent, key1).
holds(agent, key2).
is_agent(agent).
is_door(door1).
is_door(door2).

grap_key(Agent, Key) :-
    is_agent(Agent),
    at(Agent, Room), at(Key, Room),
    state(Key, free).

move(Agent, Room1, Room2) :-
    is_agent(Agent),
    (   connects(Door, Room1, Room2) ;
    	connects(Door, Room2, Room1) ),
    state(Door, open),
    Room1 \= Room2,
    at(Agent, Room1).

get_open(Agent, Door) :-
    is_agent(Agent),
    is_door(Door),
    state(Door, closed),
    opens(Key, Door),
    holds(Agent, Key).
