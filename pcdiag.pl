go :-
write('What is your name? '),
read(Patient),get_single_char(Code),
hypothesis(Patient,Disease),
write_list([Patient,', the problem is ',Disease,'.']),nl.

go :-
write('Sorry, I don''t seem to be able to'),nl,
write('diagnose the problem.'),nl.

symptom(Patient,shutsdown) :- 
verify(Patient," have a shutdown problem (y/n) ?").
symptom(Patient,longbeeping) :- 
verify(Patient," have a longbeeping problem (y/n) ?").
symptom(Patient,shortbeeping) :- 
verify(Patient," have a shortbeeping problem (y/n) ?").
symptom(Patient,display) :- 
verify(Patient," have a display problem (y/n) ?").
symptom(Patient,peripheral) :- 
verify(Patient," have a peripheral problem (y/n) ?").
symptom(Patient,bios) :- 
verify(Patient," have a bios problem (y/n) ?").
symptom(Patient,fans) :- 
verify(Patient," have a fan problem (y/n) ?").
symptom(Patient,noises) :- 
verify(Patient," have a noise problem (y/n) ?").
symptom(Patient,download) :- 
verify(Patient," have a downloading problem (y/n) ?").
symptom(Patient,cmos) :- 
verify(Patient," have a cmos problem (y/n) ?").

ask(Patient,Question) :-
	write(Patient),write(', do you'),write(Question),
	read(N),
	( (N == yes ; N == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).
	
:- dynamic yes/1,no/1.		
	
verify(P,S) :-
   (yes(S) -> true ;
    (no(S) -> fail ;
     ask(P,S))).
	 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.



hypothesis(Patient,power_supply) :-
symptom(Patient,shutsdown).

hypothesis(Patient,ram) :-
symptom(Patient,longbeeping).

hypothesis(Patient,power_supply) :-
symptom(Patient,shortbeeping).

hypothesis(Patient,graphics_card) :-
symptom(Patient,display).

hypothesis(Patient,motherboard) :-
symptom(Patient,peripheral).

hypothesis(Patient,check_boot) :-
symptom(Patient,bios).

hypothesis(Patient,check_connections) :-
symptom(Patient,fans).

hypothesis(Patient,check_dust) :-
symptom(Patient,noises).

hypothesis(Patient,check_storage) :-
symptom(Patient,download).

hypothesis(Patient,replace_cmos_battery) :-
symptom(Patient,cmos).

write_list([]).
write_list([Term| Terms]) :-
write(Term),
write_list(Terms).

response(Reply) :-
get_single_char(Code),
put_code(Code), nl,
char_code(Reply, Code).