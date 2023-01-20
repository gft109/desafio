/* A resposta será do tipo:
mesa(casais(_,_,_,_,_,_),
      casais(_,_,_,_,_,_),
      casais(_,_,_,_,_,_),
      casais(_,_,_,_,_,_),
      casais(_,_,_,_,_,_)).
*/

resolve(Solucao) :-
    Solucao = mesa(_,_,_,_,_),
% O casal que namora há um ano está ao lado da mulher que ganhou uma Bolsa.
aolado(C1, C2, Solucao),
duracao(C1, um),
presente(C2, bolsa),
% A mulher de Branco está exatamente à direita da de Amarelo.
exatamente_a_direita(C3, C4, Solucao),
vestido(C3, branco),
vestido(C4, amarelo),
% Na primeira posição está a mulher que ganhou um Perfume.
primeira(C5, Solucao),
presente(C5, perfume),
% O casal que se conheceu na Praia está em uma das pontas.
uma_das_pontas(C6, Solucao),
conheceram(C6, praia),
% Mônica está em algum lugar à direita da mulher de Vermelho.
algum_lugar_a_direita(C7, C8, Solucao),
mulher(C7, monica),
vestido(C8, vermelho),
% A mulher do vestido Branco está exatamente à esquerda de Maurício.
exatamente_a_esquerda(C9, C10, Solucao),
vestido(C9, branco),
homem(C10, mauricio),
% A mulher que ganhou um Anel está na terceira posição.
terceira(C11, Solucao),
presente(C11, anel),
% Laura está ao lado da mulher de Verde.
aolado(C12, C13, Solucao),
mulher(C12, laura),
vestido(C13, verde),
% Renan namora Denise.
casal(C14, Solucao),
homem(C14, renan),
mulher(C14, denise),
% Quem ganhou um Perfume está exatamente à esquerda do casal que se conheceu num Churrasco.
exatamente_a_esquerda(C15, C16, Solucao),
presente(C15, perfume),
conheceram(C16, churrasco),
% A mulher que ganhou uma Bolsa está em algum lugar entre o Igor e a mulher de Vermelho, nessa ordem.
entre_ordem(C18, C17, C19, Solucao),
presente(C18, bolsa),
homem(C17, igor),
vestido(C19, vermelho),
% Antônio namora Mônica.
casal(C20, Solucao),
homem(C20, antonio),
mulher(C20, monica),
% Na quarta posição está o casal que namora há 3 anos.
quarta(C21, Solucao),
duracao(C21, tres),
% O casal que namora há 2 anos está ao lado de Maurício.
aolado(C22, C23, Solucao),
duracao(C22, dois),
homem(C23, mauricio),
% O casal do namoro mais longo é aquele que se conheceu numa Festa.
casal(C24, Solucao),
duracao(C24, cinco),
conheceram(C24, festa),
% Renan está exatamente à esquerda do casal que namora há 4 anos.
exatamente_a_esquerda(C25, C26, Solucao),
homem(C25, renan),
duracao(C26, quatro),
% Claudia está na segunda posição.
segunda(C27, Solucao),
mulher(C27, claudia),
% A mulher que ganhou um Vestido está exatamente à esquerda do casal que se conheceu na Faculdade.
exatamente_a_esquerda(C28, C29, Solucao),
presente(C28, vestido),
conheceram(C29, faculdade),
% fechamento
casal(C30, Solucao),
presente(C30, sandalia),
casal(C31, Solucao),
conheceram(C31, trabalho),
casal(C32, Solucao),
mulher(C32, ana),
casal(C33, Solucao),
homem(C33, caio),
casal(C34, Solucao),
vestido(C34, azul).

vestido(casal(X,_,_,_,_,_), X).
homem(casal(_,X,_,_,_,_), X).
mulher(casal(_,_,X,_,_,_), X).
conheceram(casal(_,_,_,X,_,_), X).
duracao(casal(_,_,_,_,X,_), X).
presente(casal(_,_,_,_,_,X), X).



casal(X,mesa(X,_,_,_,_)).
casal(X,mesa(_,X,_,_,_)).
casal(X,mesa(_,_,X,_,_)).
casal(X,mesa(_,_,_,X,_)).
casal(X,mesa(_,_,_,_,X)).

primeira(X,mesa(X,_,_,_,_)).
segunda( X,mesa(_,X,_,_,_)).
terceira(X,mesa(_,_,X,_,_)).
quarta(  X,mesa(_,_,_,X,_)).
quinta(  X,mesa(_,_,_,_,X)).

aolado(X,Y,mesa(X,Y,_,_,_)).
aolado(X,Y,mesa(Y,X,_,_,_)).
aolado(X,Y,mesa(_,X,Y,_,_)).
aolado(X,Y,mesa(_,Y,X,_,_)).
aolado(X,Y,mesa(_,_,X,Y,_)).
aolado(X,Y,mesa(_,_,Y,X,_)).
aolado(X,Y,mesa(_,_,_,X,Y)).
aolado(X,Y,mesa(_,_,_,Y,X)).

uma_das_pontas(X,mesa(X,_,_,_,_)).
uma_das_pontas(X,mesa(_,_,_,_,X)).

algum_lugar_a_direita(X,Y,mesa(Y,X,_,_,_)).
algum_lugar_a_direita(X,Y,mesa(Y,_,X,_,_)).
algum_lugar_a_direita(X,Y,mesa(Y,_,_,X,_)).
algum_lugar_a_direita(X,Y,mesa(Y,_,_,_,X)).
algum_lugar_a_direita(X,Y,mesa(_,Y,X,_,_)).
algum_lugar_a_direita(X,Y,mesa(_,Y,_,X,_)).
algum_lugar_a_direita(X,Y,mesa(_,Y,_,_,X)).
algum_lugar_a_direita(X,Y,mesa(_,_,Y,X,_)).
algum_lugar_a_direita(X,Y,mesa(_,_,Y,_,X)).
algum_lugar_a_direita(X,Y,mesa(_,_,_,Y,X)).


exatamente_a_esquerda(X,Y,mesa(X,Y,_,_,_)).
exatamente_a_esquerda(X,Y,mesa(_,X,Y,_,_)).
exatamente_a_esquerda(X,Y,mesa(_,_,X,Y,_)).
exatamente_a_esquerda(X,Y,mesa(_,_,_,X,Y)).

exatamente_a_direita(X,Y,Mesa) :-
    exatamente_a_esquerda(Y,X,Mesa).



entre_ordem(X,Y,Z,mesa(Y,X,Z,_,_)).
entre_ordem(X,Y,Z,mesa(Y,X,_,Z,_)).
entre_ordem(X,Y,Z,mesa(Y,X,_,_,Z)).
entre_ordem(X,Y,Z,mesa(Y,_,X,Z,_)).
entre_ordem(X,Y,Z,mesa(Y,_,X,_,Z)).
entre_ordem(X,Y,Z,mesa(Y,_,_,X,Z)).
entre_ordem(X,Y,Z,mesa(_,Y,X,Z,_)).
entre_ordem(X,Y,Z,mesa(_,Y,X,_,Z)).
entre_ordem(X,Y,Z,mesa(_,Y,_,X,Z)).
entre_ordem(X,Y,Z,mesa(_,_,Y,X,Z)).
