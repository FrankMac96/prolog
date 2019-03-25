/****************************************************
*Frank MacDonald
*Dr.Marling
*CS 4800
*Hwork2
****************************************************/

/* Facts about the pet options. */ 

% Case 1
type(dragon,magical).
fire_breathing(dragon).
mortal(dragon).
gigantic(dragon).
carnivorous(dragon).
strength_level(dragon,godlike).
living_space(dragon,caves).
mount_speed(dragon, 10).

% Case 2
type(unicorn,magical).
mortal(unicorn).
rainbow_shooting(unicorn).
medium(unicorn).
herbivore(unicorn).
strength_level(unicorn,4).
living_space(unicorn,fields).
mount_speed(unicorn,6).

% Case 3
type(dogs,non_magical).
barking(dogs).
mortal(dogs).
small(dogs).
strength_level(dogs,2).
carnivorous(dogs).
living_space(dogs,house).
mount_speed(dogs,3).

% Case 4
type(horse,non_magical).
mortal(horse).
medium(horse).
herbivore(horse).
strength_level(horse,4).
living_space(horse,fields).
mount_speed(horse,5).

% Case 5
type(pig,non_magical).
mortal(pig).
small(pig).
omnivore(pig).
strength_level(pig,2).
living_space(pig,fields).
mount_speed(pig,2).

% Case 6
type(phoenix,magical).
immortal(phoenix).
gigantic(phoenix).
carnivorous(phoenix).
strength_level(phoenix,8).
living_space(phoenix,caves).
mount_speed(phoenix,10).

% Case 7
type(lion,non_magical).
mortal(lion).
medium(lion).
carnivorous(lion).
strength_level(lion,5).
living_space(lion,caves).
mount_speed(lion,5).

% Case 8
type(elephant,non_magical).
mortal(elephant).
huge(elephant).
herbivore(elephant).
strength_level(elephant,6).
living_space(elephant,fields).
mount_speed(elephant,4).

% Case 9
type(gargoyle,magical).
mortal(gargoyle).
medium(gargoyle).
carnivorous(gargoyle).
strength_level(gargoyle,6).
living_space(gargoyle,caves).
mount_speed(gargoyle,6).

% Case 10
type(axolotl,non_magical).
mortal(axolotl).
small(axolotl).
carnivorous(axolotl).
strength_level(axolotl,1).
living_space(axolotl,underwater).
mount_speed(axolotl,1).

% Case 11
type(pangolin,non_magical).
mortal(pangolin).
small(pangolin).
herbivore(pangolin).
strength_level(pangolin,1).
living_space(pangolin,fields).
mount_speed(pangolin,2).

% Case 12
type(kangaroo,non_magical).
mortal(kangaroo).
medium(kangaroo).
herbivore(kangaroo).
strength_level(kangaroo,4).
living_space(kangaroo,fields).
mount_speed(kangaroo,4).

% Case 13
type(monkey,non_magical).
mortal(monkey).
small(monkey).
omnivore(monkey).
strength_level(monkey,2).
living_space(monkey,forest).
mount_speed(monkey,2).

% Case 14
type(bear,non_magical).
mortal(bear).
huge(bear).
carnivorous(bear).
strength_level(bear,5).
living_space(pangolin, woods).
mount_speed(bear,3).

% Case 15
type(minotaur,magical).
mortal(minotaur).
huge(minotaur).
carnivorous(minotaur).
strength_level(minotaur,9).
living_space(minotaur,dungeon).
mount_speed(minotaur,5).

% Case 16
type(griffin,magical).
mortal(griffin).
medium(griffin).
carnivorous(griffin).
strength_level(griffin,5).
living_space(griffin,caves).
mount_speed(griffin,8).

% Case 17
type(leviathon,magical).
mortal(leviathon).
gigantic(leviathon).
carnivorous(leviathon).
strength_level(leviathon,godlike).
living_space(leviathon,underwater).
mount_speed(leviathon,8).

% Case 18
type(basilisk,magical).
mortal(basilisk).
medium(basilisk).
carnivorous(basilisk).
strength_level(basilisk,4).
living_space(basilisk,caves).
mount_speed(basilisk,3).

% Case 19
type(cerberus,magical).
mortal(cerberus).
huge(cerberus).
carnivorous(cerberus).
strength_level(cerberus,10).
living_space(cerberus,underworld).
mount_speed(cerberus,5).

% Case 20
type(cyclops,magical).
mortal(cyclops).
huge(cyclops).
carnivorous(cyclops).
strength_level(cyclops,strong).
living_space(cyclops,caves).
mount_speed(cyclops,slow).

/* The rules in order to decide what pet or pets you would like.
There are alot of facts regarding each pet. */

desired_type(magical) :- will_accept_type(M), M == 1.
desired_type(non_magical) :- will_accept_type(M), M == 0.

desired_speed(slow) :- will_accept(M), M < 3.
desired_speed(moderate) :- will_accept(M), M >= 3, M < 6.
desired_speed(fast) :- will_accept(M), M >= 6.

desired_str(weak) :- will_accept_str(M), M < 3.
desired_str(moderate) :- will_accept_str(M), M >= 3, M < 6.
desired_str(strong) :- will_accept_str(M), M >= 6, M <= 10.
desired_str(amazing) :- will_accept_str(M), M = godlike.

speed_ok(R) :- mount_speed(X, R), desired_speed(R).
strength_ok(R) :- strength_level(X, R), desired_str(R).
type_ok(R) :- type(X,R), desired_type(R).

pet(R) :- speed_ok(R), strength_ok(R),type_ok(R).

/* question time */

advise :- 
          write('How faster do you want the pet to be? '),
          read(Speed), nl,
          assert(will_accept(Speed)), 
          write('How strong do you want the pet to be? '),
          read(Strength), nl,
          assert(will_accept_str(Strength)), 
          write('What type of pet do you want?'),
          read(Type), nl,
          assert(will_accept_type(Type)),
          findall(R,pet(R),Rs),
          write('You might enjoy the following pets: '), nl,
          writelist(Rs),
          retract(will_accept(Speed)),retract(will_accept_str(Strength)),retract(will_accept_type(Type)).

writelist([]).
writelist([H|T]) :- writeonce(H,T), writelist(T).  
writeonce(H,T) :- member(H,T).
writeonce(H,T) :- not(member(H,T)), write(H), nl.



