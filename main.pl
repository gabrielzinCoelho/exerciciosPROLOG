maiorDeDois(A, B, A) :-
    A >= B, !.
maiorDeDois(_, B, B).

maiorDeTres(A, B, C, MaiorABC) :-
    maiorDeDois(A, B, MaiorAB),
    maiorDeDois(MaiorAB, C, MaiorABC).

fatorial(0, 1) :- !.
fatorial(N, X) :-
    N > 0,
    NmenosUm is N - 1,
    fatorial(NmenosUm, FatNmenosUm),
    X is N * FatNmenosUm.

'n_esimo'(1, [C|_], C) :- !.
'n_esimo'(N, [_|R], X) :-
    NmenosUm is N - 1,
    'n_esimo'(NmenosUm, R, X).

pertence(C, [C|_]) :- !.
pertence(X, [_|R]) :-
    pertence(X, R).

unicaOcorrencia(C, [C|R]) :- !,
    not(pertence(C, R)).
unicaOcorrencia(X, [_|R]) :-
    unicaOcorrencia(X, R).