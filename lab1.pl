%problema1


autor(eu).

calatorit(eu,spania).

oras(valencia).

tara(spania).

apartine(valencia,spania).

vizitat(eu,valencia,februarie).

vizitat(eu,bioparc).

zoo(bioparc).


animal_salbatic(elefant).

animal_salbatic(maimuta).

animal_salbatic(girafa).

animal_salbatic(zebra).


animal_apartinator(X,Y):-
	zoo(Y),
	animal_salbatic(X).

personal(ingrijitori).

uniforma(ana).

uniforma(roxana).

uniforma(ion).

uniforma(darius).


culoare(ana,galben).

culoare(roxana, rosu).

culoare(ion, negru).

culoare(darius, maro).


salariu(ana,1200).

salariu(ion, 500).

salariu(roxana, 9000).


ingrijitor(X):-
	uniforma(X),
	culoare(X,_),
	salariu(X,_).

hraneste(X,Y):-
	ingrijitor(X),
	animal_apartinator(Y,bioparc).

turist(mimi).

turist(john).

turist(maia).

vizitat(mimi,bioparc).

vizitat(john,bioparc).


ghideaza(X,Y):-
	ingrijitor(X),
	turist(Y),
	vizitat(Y,bioparc).


%problema2
female(ana).
female(maria).

male(doru).
male(albert).



father(doru,ana).
father(doru,maria).
sisters(X,Y):-
	female(X),
	female(Y),
	male(Z),
	father(Z,X),
	father(Z,Y).



%problema3
%calculati (cu si fara acumulatori):
%inversa unei liste 
%lungimea unei liste
%lista cu elementele pare ale unei liste 
%lista cu elementele impare ale unei liste 

inversa1([],[]).
inversa1([H|T], R):-
	inversa1(T,Res),
	append(Res,[H],R).


inversa2([H|T], Res):-
	inversa2Acc([H|T],[],Res).

inversa2Acc([],Acc,Acc).

inversa2Acc([H|T],Acc,R):-
	inversa2Acc(T,[H|Acc],R).

%lungimea unei liste 


lungime1([],0).
lungime1([H|T],X):-
	lungime1(T,R),
	X is R+1.

lungime2([H|T],R):-
	lungime2Acc([H|T],0,R).

lungime2Acc([],Acc,Acc).

lungime2Acc([H|T],Acc,R):-
	NewAcc is Acc+1,
	lungime2Acc(T,NewAcc,R).

%lista cu elementele pare ale listei
elpare1([],[]):-
	!.

elpare1([H|T],[H|T1]):-
	H mod 2 =:= 0, !,
	elpare1(T,T1).

elpare1([H|T],R):-
	elpare1(T,R).


elpare2([H|T], R):-
	elpare2Acc([H|T],[],R).

elpare2Acc([],Acc,Acc).

elpare2Acc([H|T],Acc,R):-
	H mod 2 =:= 0, !,
	append(Acc,[H],NewAcc),
	elpare2Acc(T,NewAcc,R).
elpare2Acc([H|T],Acc,R):-
	elpare2Acc(T,Acc,R).


%lista cu elementele impare ale listei

elimpare1([],[]).

elimpare1([H|T],[H|T1]):-
	H mod 2 =:= 1, !,
	elimpare1(T,T1).

elimpare1([H|T],R):-
	elimpare1(T,R).

elimpare2([H|T],R):-
	elimpare2Acc([H|T],[],R).

elimpare2Acc([],Acc,Acc).

elimpare2Acc([H|T],Acc,R):-
	H mod 2 =:= 1, !,
	append(Acc,[H],NewAcc),
	elimpare2Acc(T,NewAcc,R).
elimpare2Acc([H|T],Acc,R):-
	elimpare2Acc(T,Acc,R).

%problema 4
%verificare numar prim 

divizibil(X,Y):-
	N is Y * Y,
	N =< X,
	X mod Y =:= 0.

divizibil(X,Y):-
	Y < X,
	Y1 is Y+1,
	divizibil(X,Y1).

prim(X):-
	Y is 2,
	X > 1,
	\+ divizibil(X,Y). %negatia ca insucces


%problema5
%lista cu factorii primi ai unui numar. 

facts(1,_,[]).

facts(X,D,[D|T]):-
	Temp is D+1,
	X mod D =:= 0,
	DTemp is X//D,
	facts(DTemp,D,T).
facts(X,D,R):-
	Dnext is D+1,
	facts(X,Dnext,R).
factori(X,R):-
	Y is 2,
	facts(X,Y,R), !.



%problema 6. ridicarea la putere.


putere(0,X,0):-
	X > 0.

putere(0,_,"undefined").

putere(_,0,1):- !.	

putere(X,Y,R):-
	Temp1 is Y-1,
	putere(X,Temp1,R1),
	R is R1 * X.

%problema 7. factorialul unui numar.


%fara acc 

fact(0,1):- !.

fact(N, P):-
	Prev is N-1,
	fact(Prev, P1),
	P is P1 * N.

%cu acc 

fact2(N,R):-
	factAcc(N,1,R).

factAcc(0,Acc,Acc):- !.
factAcc(N,Acc,R):-
	Prev is N-1,
	NewAcc is Acc * N,
	factAcc(Prev,NewAcc,R).



%problema 8. media elementelor unei liste.


media([H|T],R):-
	suma([H|T],S),
	lungime1([H|T], L),
	R is S/L.

suma([],0).
suma([H|T],S):-
	suma(T,S1),
	S is S1+H.

%problema 9. abaterea standard a elementelor unei liste 

abatereasd([H|T],R):-
	suma([H|T],S),
	lungime1([H|T],L),
	media([H|T],M),
	R is S - M * L.


%problema 10. Sirul lui fibonacci


%cu generare de lista 
fib(0, [0]).
fib(1, [1,0]).
fib(N, [R,X,Y|Zs]) :-
    N > 1,
    N1 is N - 1,
    fib(N1, [X,Y|Zs]),
    R is X + Y.


%problema 11. Seturi

set([]):-
	!.
set([X]):-
	!.

set([H1,H2|T]):-
	not(member(H1,T)),
	not(member(H2,T)),
	H1 < H2,
	set(T).

%reuniune
union([],X,X).

union([H|T],L2,[H|T2]):-
	union(T,L2,T2).

%intersectie

intersect([],X,X).


intersect([H|T1],L2,L3):-
	intersect(T1,L2,L3), !.

intersect([H|T1],L2,[H|T2]):-
	member(H,L2),
	intersect(T1,L2,T2).

%diferenta

dif([],X,R):- !.

dif([H|T],L2,[H|T2]):-
	not(member(H,L2)),
	dif(T,L2,T2).

dif([H|T],L2,R):-
	dif(T,L2,R).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PROBLEME_SUPLIMENTARE_TEST%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%problema1

nat(0):-!.
nat(X):-
	X > 0,
	Prev is X-1,
	nat(Prev).

s(X,R):-
	nat(X),
	R is X+1.

pluss(0,Y,Y):-
	nat(Y).

pluss(Y,0,Y):-
	nat(Y).

pluss(X,Y,R):-
	nat(X),nat(Y),
	R is X+Y.

ori(1,Y,Y):- !.

ori(X,Y,R):-
	nat(X),nat(Y),
	Temp is X-1,
	ori(Temp,Y,R1),
	pluss(R1,Y,R).


%problema2 - palindrom 


egale([],[]).
egale([H|T1],[H|T2]):-
	egale(T1,T2).

palindrom([]).

palindrom(L):-
	inversa1(L,L1),
	egale(L1,L).


%problema3 - maximul

%cu acumulator 

maxim([H|T],M):-
	maximAcc(T,H,M).

maximAcc([],Acc,Acc).

maximAcc([H|T],Acc,M):-
	H > Acc, !,
	NewAcc is H,
	maximAcc(T,NewAcc,M).

maximAcc([H|T],Acc,M):-
	maximAcc(T,Acc,M).

%minimul cu acumulator

minim([H|T],M):-
	minimAcc(T,H,M).

minimAcc([],Acc,Acc).

minimAcc([H|T],Acc,M):-
	H < Acc, !,
	NewAcc is H,
	minimAcc(T,NewAcc,M).

minimAcc([H|T],Acc,M):- minimAcc(T,Acc,M).

%problema4 - shift_stg

sh_sg([H|T],R):-
	Temp=T,
	append(Temp,[H],R).

%problema5 - shift_dr


ultimul([H],H):- !.

ultimul([H|T],X):- ultimul(T,X).

ultimul([],0).

lista_fara_ultimul([H],[]):- !.

lista_fara_ultimul([H|T],[H|T1]):-
	lista_fara_ultimul(T,T1).

sh_dr(L,R):-
	ultimul(L,X),
	lista_fara_ultimul(L,L1),
	append([X],L1,R).


%problema6 - factorial cu acumulator

fact(N,R):-
	factAcc(N,1,R).

factAcc(0,Acc,Acc).

factAcc(N,Acc,R):-
	N>0, !,
	Prev is N-1,
	NewAcc is Acc * N,
	factAcc(Prev,NewAcc,R).

%stergerea duplicatelor dintr-o lista

%cu mentinerea ultimei aparitii

faraDup([],[]).
faraDup([H|T],[H|T1]):-
	not(member(H,T)), !,
	faraDup(T,T1).

faraDup([H|T],R):-
	faraDup(T,R).

%cu mentinerea primei aparitii

faraDup2(L,R):-
	faraDup2Acc(L,[],R).

faraDup2Acc([],Acc,Acc).
faraDup2Acc([H|T],Acc,R):-
	not(member(H,Acc)), !,
	append(Acc,[H],NewAcc),
	faraDup2Acc(T,NewAcc,R).

faraDup2Acc([H|T],L,R):-
	faraDup2Acc(T,L,R).


%problema 7 - stergerea de vocale dintr-un sir.

string_to_list_of_characters(String, Characters) :-
	name(String, Xs),
	maplist( number_to_character,
	Xs, Characters ).

number_to_character(Number, Character) :-
	name(Character, [Number]).


vocala('a').
vocala('e').
vocala('i').
vocala('o').
vocala('u').

vocala('A').
vocala('E').
vocala('I').
vocala('O').
vocala('U').

consoana(X):-
	member(X,['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z']).

sterge_vocale(Sir,SirNou):-
	string_to_list_of_characters(Sir,SirTemp),
	sterge_voc(SirTemp,SirNouTemp),
	atom_chars(SirNou,SirNouTemp).

sterge_voc([],[]).
sterge_voc([H|T],[H|T1]):-
	not(vocala(H)),!,
	sterge_voc(T,T1).

sterge_voc([_|T], L):-
	sterge_voc(T,L).


%problema 8 - schimba sir
%toate vocalele in litera mare 
%toate consoanele in litera mica 
%toate celelalte caractere in 0.


modifica([],[]).

modifica(L,R):-
	modificaAcc(L,[],R).

modificaAcc(L,Acc,Acc).

modificaAcc([H|T],Acc,R):-
	vocala(H).


%problema9

%fara acumulator 
suma_si_patrate([],0,0).

suma_si_patrate([H|T],S,Sq):-
	suma_si_patrate(T,S1,Sq1),
	S is S1+H,
	Sq is Sq1+H*H.

%cu acumulator.

sumsq(L,S,Sq):-
	sumsqAcc(L,0,S,0,Sq).

sumsqAcc([],SAcc,SAcc,SqAcc,SqAcc).

sumsqAcc([H|T], SAcc, S, SqAcc, Sq):-
	Acc1 is SAcc + H,
	Acc2 is SqAcc + H*H,
	sumsqAcc(T,Acc1,S,Acc2,Sq).


%problema 10 - prefixe

prefix([],_).

prefix([H|T],[H|T1]):-
	prefix(T,T1).

%problema 11 - sufixe

sufix(L1,L2):-
	reverse(L1,Temp1),
	reverse(L2,Temp2),
	prefix(Temp1,Temp2).

%problema 12 - sublista

sublista([],_).

sublista([H|T],[H|T1]):-
	sublista(T,T1), !.

sublista([H|T],[H1|T1]):-
	sublista([H|T],T1).

%problema 13 - sortare prin insertie

sortare([],[]).
sortare([H|T],R):-
	sortare(T,Sortat),
	inserare(H,Sortat,R).

inserare(X,[H|T],[H|T2]):-
	X > H, !, inserare(X,T,T2).

inserare(X,T,[X|T]).


%problema 14 - sortare prin selectie 
inserare2(M,T,[M|T]).
ssort([],[]).
ssort([H|T],R):-
	ssort(T,Sortat),
	minim([H|T],M),
	inserare2(M,Sortat,R).

minim([H|T],M):-
	minimAcc(T,H,M).

minimAcc([],Acc,Acc).

minimAcc([H|T],Acc,M):-
	H < Acc, !,
	NewAcc is H,
	minimAcc(T,NewAcc,M).

minimAcc([H|T],Acc,M):-
	minimAcc(T,Acc,M).



%problema17-de 2 ori mai lung 

twotimeslong([],[]).

twotimeslong([H1,H2|T],[H|T2]):-
	twotimeslong(T,T2).

%problema18-fibonacci
fibb(0,0):- !.
fibb(1,1):- !.

fibb(N,F):-
	N > 1,
	Prev1 is N-1,
	Prev2 is N-2,
	fibb(Prev1,F1),
	fibb(Prev2,F2),
	F is F1+F2.

%problema19-cmmdc

cmmdc(X,X,X):-!.

cmmdc(X,Y,R):- 
	X > Y, !,
	Temp is X-Y,
	cmmdc(Temp,Y,R).

cmmdc(X,Y,R):-
	Temp is Y-X,
	cmmdc(X,Temp,R).

%problema20-fara_dubluri_1

fara_dubluri_1(Xs,Ys):-
	faraDup(Xs,Resx), %mentin ultima aparitie 
	egale(Resx,Ys).

%problema21-fara_dubluri_2

fara_dubluri_2(Xs,Ys):-
	faraDup2(Xs,Resx), %mentin prima aparitie 
	egale(Resx,Ys).


%problema22-sterge-tot 

sterg_tot(_,[],[]):-!.

sterg_tot(X,[X|T],Res):-
	!,sterg_tot(X,T,Res).

sterg_tot(X,[H|T],[H|T1]):-
	sterg_tot(X,T,T1).

%problema23-sterge_primul
sterge_primul(X,L,R):-
	sterge_primulH(X,L,0,R).

sterge_primulH(_,[],_,[]).

sterge_primulH(X,[H|T], K, [H|T1]):-
	K > 1, !,
	Next is K+1,
	sterge_primulH(X,T,Next,T1).

sterge_primulH(H,[H|T], K, R):-
	Next is K+1,
	sterge_primulH(H,T,Next,R).

%aparitii 

membru2(X,[[X,Y]|T]):-!.


membru2(X,[[H1,H2]|T]):-
	membru2(X,T).


apare(X,[H|T],[X,R]):-
	de_cate_ori_apare([H|T],X,R).

de_cate_ori_apare([],_,0):-!.

de_cate_ori_apare([H|T],X,K):-
	X=:=H, !,
	de_cate_ori_apare(T,X,Next),
	K is Next+1.

de_cate_ori_apare([H|T],X,K):- de_cate_ori_apare(T,X,K).

aparitii([H|T],Res):-
	aparitiiAcc([H|T],[],Res).

aparitiiAcc([],Acc,Acc).

aparitiiAcc([H|T],Acc,Res):-
	not(membru2(H,Acc)),!,
	de_cate_ori_apare(H,[H|T],K),
	append(Acc,[[H,K]],NewAcc),
	aparitiiAcc(T,NewAcc,Res).

aparitiiAcc([H|T],Acc,Res):-
	aparitiiAcc(T,Acc,Res).