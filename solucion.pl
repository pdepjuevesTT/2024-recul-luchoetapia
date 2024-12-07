barrio(almagro).
barrio(flores).

% Propieades: propiedad(propietario, Casa | depto | loft, barrio, precio)
% Casas: casa(metrosCuadrados)
propiedad(juan, casa(120), almagro, 150000).
propiedad(fer, casa(110), flores, 60000).

% Departamentos: depto(ambientes, banios)
propiedad(nico, depto(2, 2), almagro, 80000).
propiedad(alf, depto(3, 1), almagro, 60000).
propiedad(vale, depto(4, 1), flores, 95000).

% Loft: loft(anio)
propiedad(jualian, loft(2000), almagro, 140000).

% Propiedad copada
propiedadCopada(casa(Metros)) :-
    Metros > 100.

propiedadCopada(depto(Ambientes, _)) :-
    Ambientes > 3.

propiedadCopada(depto(_, Banios)) :-
    Banios > 1.

barrioCopado(Barrio) :-
    barrio(Barrio),
    forall(propiedad(_, Prop, Barrio, _), propiedadCopada(Prop)).

% Barrio caro
esbarato(loft(Anio)) :-
    Anio < 2005.

esBarato(casa(_, Metros, _)) :-
    Metros < 90.

esBarato(depto(_, Ambientes, _, _)) :-
    Ambientes < 3.

barrioCaro(Barrio) :-
    barrio(Barrio),
    forall(propiedad(_, Prop, Barrio, _), not(esBarato(Prop))).

     

