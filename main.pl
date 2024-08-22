maiorDeDois(A, B, A) :-
    A >= B, !.
maiorDeDois(_, B, B).

maiorDeTres(A, B, C, MaiorABC) :-
    maiorDeDois(A, B, MaiorAB),
    maiorDeDois(MaiorAB, C, MaiorABC).

fatorial(0, 1) :- !.
fatorial(N, X) :-
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

maioresQue(X, [C|R], [C|MR]) :-
    C > X, !,
    maioresQue(X, R, MR).
maioresQue(X, [_|R], MR) :-
    maioresQue(X, R, MR).
maioresQue(_, [], []).

concatena([C1|R1], L2, [C1|CONC]) :-
    concatena(R1, L2, CONC).
concatena([], L2, L2).

remove(C, [C|R], R) :- !.
remove(X, [C|R], [C|RsemX]) :-
    remove(X, R, RsemX).
remove(_, [], []).

removerUltimo([_], []) :- !.
removerUltimo([C|R], [C|RsemUltimo]) :-
    removerUltimo(R, RsemUltimo).

removerTodos(X, [X|R], RsemX) :- !,
    removerTodos(X, R, RsemX).
removerTodos(X, [C|R], [C|RsemX]) :- !,
    removerTodos(X, R, RsemX).
removerTodos(_, [], []).

removerRepetidos([C|R], [C|RsemRep]) :-
    removerTodos(C, R, RsemC),
    removerRepetidos(RsemC, RsemRep).
removerRepetidos([], []).

removerRepetidos2([C|R], [C|RsemRep]) :-
    not(pertence(C, R)), !,
    removerRepetidos2(R, RsemRep).
removerRepetidos2([_|R], RsemRep) :-
    removerRepetidos2(R, RsemRep).
removerRepetidos2([], []).

% maiores(N, L)

geraSequencia(1, [1, -1]) :- !.
geraSequencia(N, L) :-
    NmenosUm is N - 1,
    Nnegativo is -N,
    geraSequencia(NmenosUm, SeqNmenosUm),
    concatena(SeqNmenosUm, [N, Nnegativo], L).


% ehInteiro(0).
% ehInteiro(X) :-
%     ehInteiro(Y),
%     X is Y + 1.