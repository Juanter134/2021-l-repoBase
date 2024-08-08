% Parcial Parque de atracciones %
persona(nina, 22, 1.60).
persona(marcos, 8, 1.32).
persona(osvaldo, 13, 1.29).

puedeSubirse(tren_fantasma, Persona):-
    persona(Persona, Edad, _),
    Edad >= 12.
puedeSubirse(montania_rusa, Persona):-
    persona(Persona, _, Altura),
    Altura > 1.30.
puedeSubirse(maquina_tiquetera, Persona):-
    persona(Persona, _, _).

puedeSubirse(tobogan_gigante, Persona):-
    persona(Persona, _, Altura),
    Altura >= 1.50.
puedeSubirse(rio_lento, Persona):-
    persona(Persona, _, _).
puedeSubirse(maremoto, Persona):-
    persona(Persona, Edad, _),
    Edad >= 5.

atraccion(Atraccion):-
    puedeSubirse(Atraccion, _).

parque(parque_acuatico, [tobogan_gigante, rio_lento, maremoto]).
parque(parque_de_atracciones, [tren_fantasma, montania_rusa, maquina_tiquetera]).

esParaElle(Persona, Parque):-
    persona(Persona, _, _),
    parque(Parque, Atracciones),
    forall(member(Atraccion, Atracciones), puedeSubirse(Atraccion, Persona)).

programa(parque_acuatico, [tobogan_gigante, maremoto, rio_lento]).
