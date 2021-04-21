%s(s(NP,VP)) --> np(NP,SP,P),vp(VP,SP,P).

%np(np(DET,N),SP) --> det(DET,SP),n(N,SP).
%np(np(PRO),SP,P) --> pro(PRO,SP,P,subject).
%np(np(DET,NBAR,PP),SP) --> det(DET,SP),nbar(NBAR,SP),pp(PP).
%nbar(nbar(N),SP) -->n(N,SP).
%nbar(nbar(JPA,JPB),SP) --> jp(JPA,SP),jp(JPB,SP).
%jp(jp(JPA,JPB),SP) --> adj(JPA),jp(JPB,SP).
%jp(jp(JPA,N),SP) -->adj(JPA),n(N,SP).
%pp(pp(PREP,NP)) --> prep(PREP),np(NP,_).
%vp(vp(V,NP),SP,P) --> v(V,tv,SP,P),np(NP,_).
%vp(vp(V,PRO),SP,P) --> v(V,tv,SP,P),pro(PRO,SP,_,object).
%vp(vp(V),SP,P) --> v(V,iv,SP,P).
%
%nbar(jp(adj(tall), jp(adj(young), n(men))))
s(s(NP,VP)) --> np(NP,SP,P,subject),vp(VP,SP,P,_).
np(np(DET,NBAR),SP,_,_) --> det(DET,SP),nbar(NBAR,SP).
np(np(PRO),SP,P,SO) --> pro(PRO,SP,P,SO).
np(np(DET,NBAR,PP),SP,_,_)-->det(DET,SP),nbar(NBAR,SP),pp(PP,_,_,_).
nbar(nbar(N),SP) -->n(N,SP).
nbar(nbar(JPA),SP) --> jp(JPA,SP).

pp(pp(PREP,NP,PPB),_,_,_)-->prep(PREP),np(NP,_,_,object),pp(PPB,_,_,_).
pp(pp(PREP,NP),_,_,_)-->prep(PREP),np(NP,_,_,object).

jp(jp(JPA,JPB),SP) --> adj(JPA),jp(JPB,SP).
jp(jp(JPA,N),SP) -->adj(JPA),n(N,SP).

vp(vp(V,NP),SP,P,_) --> v(V,tv,SP,P),np(NP,_,_,object).
%vp(vp(V,PRO),SP,P,_) --> v(V,tv,SP,P),pro(PRO,_,_,object).
vp(vp(V),SP,P,_) --> v(V,iv,SP,P).



pro(pro(Word),SP,P,SO)-->[Word],{lex(Word,pro,SP,P,SO)}.
v(v(Word),V,SP,P)-->[Word],{lex(Word,V,SP,P)}.

det(det(Word),SP) --> [Word], {lex(Word,det,SP)}.
n(n(Word),SP) --> [Word], {lex(Word,n,SP)}.

prep(prep(Word)) --> [Word], {lex(Word,prep)}.
adj(adj(Word)) --> [Word], {lex(Word,adj)}.


%Pronoun
lex(i,pro,singular,1,subject).
lex(you,pro,singular,2,subject).
lex(he,pro,singular,3,subject).
lex(she,pro,singular,3,subject).
lex(it,pro,singular,3,subject).
lex(we,pro,plural,1,subject).
lex(you,pro,plural,2,subject).
lex(they,pro,plural,3,subject).
lex(me,pro,singular,1,object).
lex(you,pro,singular,2,object).
lex(him,pro,singular,3,object).
lex(her,pro,singular,3,object).
lex(it,pro,singular,3,object).
lex(us,pro,plural,1,object).
lex(you,pro,plural,2,object).
lex(them,pro,plural,3,object).


%Verb
lex(know,tv,singular,1).
lex(know,tv,singular,2).
lex(knows,tv,singular,3).
lex(know,tv,plural,_).
lex(see,tv,singular,1).
lex(see,tv,singular,2).
lex(sees,tv,singular,3).
lex(see,tv,plural,_).
lex(hire,tv,singular,1).
lex(hire,tv,singular,2).
lex(hires,tv,singular,3).
lex(hire,tv,plural,_).
lex(fall,iv,singular,1).
lex(fall,iv,singular,2).
lex(falls,iv,singular,3).
lex(fall,iv,plural,_).
lex(sleep,iv,singular,1).
lex(sleep,iv,singular,2).
lex(sleeps,iv,singular,3).
lex(sleep,iv,plural,_).


%Determiner
lex(the,det,_).
lex(a,det,singular).
lex(two,det,plural).




%Noun
lex(man,n,singular).
lex(woman,n,singular).
lex(apple,n,singular).
lex(chair,n,singular).
lex(room,n,singular).
lex(men,n,plural).
lex(women,n,plural).
lex(apples,n,plural).
lex(chairs,n,plural).
lex(rooms,n,plural).

%Preposition
lex(on,prep).
lex(in,prep).
lex(under,prep).

%Adjectives
lex(old,adj).
lex(young,adj).
lex(red,adj).
lex(short,adj).
lex(tall,adj).

%1
% ?- s(T,[the,woman,sees,the,apples],[]).T = s(np(det(the),
% nbar(n(woman)))%, vp(v(sees), np(det(the), nbar(n(apples))))) ;
%false.

%2
%?- s(T,[a,woman,knows,him],[]).
%T = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him)))) ;
%false.

%3
%?- s(T,[two,woman,hires,a,man],[]).
%false.

%4
%?- s(T,[two,women,hire,a,man],[]).
% T = s(np(det(two), nbar(n(women))), vp(v(hire), np(det(a),
% nbar(n(man))))) ;
%false.

%5
%?- s(T,[she,knows,her],[]).
%T = s(np(pro(she)), vp(v(knows), np(pro(her)))) ;
%false.

%6
%
%?- s(T,[she,know,the,man],[]).
%false.

%7
%?- s(T,[us,see,the,apple],[]).
%false.

%8
%?- s(T,[we,see,the,apple],[]).
%T = s(np(pro(we)), vp(v(see), np(det(the), nbar(n(apple))))) ;
%false.

%9
%?- s(T,[i,know,a,short,man],[]).
% T = s(np(pro(i)), vp(v(know), np(det(a), nbar(jp(adj(short),
% n(man)))))) ;
%false.

%10
%?- s(T,[he,hires,they],[]).
%false.

%11
%?- s(T,[two,apples,fall],[]).
%T = s(np(det(two), nbar(n(apples))), vp(v(fall))) ;
%false.

%12
%?- s(T,[the,apple,falls],[]).
%T = s(np(det(the), nbar(n(apple))), vp(v(falls))) ;
%false.

%13
%?- s(T,[the,apples,fall],[]).
%T = s(np(det(the), nbar(n(apples))), vp(v(fall))) ;
%false.

%14
%?- s(T,[i,sleep],[]).
%T = s(np(pro(i)), vp(v(sleep))) ;
%false.

%15
%?- s(T,[you,sleep],[]).
%T = s(np(pro(you)), vp(v(sleep))) ;
%T = s(np(pro(you)), vp(v(sleep))) ;
%false.

%16
%?- s(T,[she,sleeps],[]).
%T = s(np(pro(she)), vp(v(sleeps))) ;
%false.

%17
%?- s(T,[he,sleep],[]).
%false.

%18
%?- s(T,[them,sleep],[]).
%false.

%19
%?- s(T,[a,men,sleep],[]).
%false.

%20
%?- s(T,[the,tall,woman,sees,the,red],[]).
%false.

%21
%?- s(T,[the,young,tall,man,knows,the,old,short,woman],[]).
% T = s(np(det(the), nbar(jp(adj(young), jp(adj(tall), n(man))))),
% vp(v(knows), np(det(the), nbar(jp(adj(old), jp(adj(short),
% n(woman))))))) ;
%false.

%22
%?- s(T,[a,man,tall,knows,the,short,woman],[]).
%false.

%23
%?- s(T,[a,man,on,a,chair,sees,a,woman,in,a,room],[]).
% T = s(np(det(a), nbar(n(man)), pp(prep(on), np(det(a),
% nbar(n(chair))))), vp(v(sees), np(det(a), nbar(n(woman)), pp(prep(in),
% np(det(a), nbar(n(room))))))) ;
%false.

%24
%?- s(T,[a,man,on,a,chair,sees,a,woman,a,room,in],[]).
%false.

%25
% ?-
% s(T,[the,tall,young,woman,in,a,room,on,the,chair,in,a,room,in,the,room%,sees,the,red,apples,under,the,chair],[]).
%
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room))), pp(prep(on), np(det(the),
% nbar(n(chair))), pp(prep(in), np(det(a), nbar(n(room))), pp(prep(in),
% np(det(the), nbar(n(room)))))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
%
%
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room))), pp(prep(on), np(det(the),
% nbar(n(chair))), pp(prep(in), np(det(a), nbar(n(room)), pp(prep(in),
% np(det(the), nbar(n(...))))))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room))), pp(prep(on), np(det(the),
% nbar(n(chair)), pp(prep(in), np(det(a), nbar(n(room))))), pp(prep(in),
% np(det(the), nbar(n(room))))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room))), pp(prep(on), np(det(the),
% nbar(n(chair)), pp(prep(in), np(det(a), nbar(n(room))), pp(prep(in),
% np(det(the), nbar(n(...))))))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room))), pp(prep(on), np(det(the),
% nbar(n(chair)), pp(prep(in), np(det(a), nbar(n(room)), pp(prep(in),
% np(det(...), nbar(...))))))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the),
% nbar(n(chair))), pp(prep(in), np(det(a), nbar(n(room)))))),
% pp(prep(in), np(det(the), nbar(n(room)))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the),
% nbar(n(chair))))), pp(prep(in), np(det(a), nbar(n(room))), pp(prep(in),
% np(det(the), nbar(n(room))))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the),
% nbar(n(chair))))), pp(prep(in), np(det(a), nbar(n(room)), pp(prep(in),
% np(det(the), nbar(n(room)))))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the),
% nbar(n(chair)), pp(prep(in), np(det(a), nbar(n(...))))))), pp(prep(in),
% np(det(the), nbar(n(room)))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the),
% nbar(n(chair))), pp(prep(in), np(det(a), nbar(n(room))), pp(prep(in),
% np(det(the), nbar(n(...))))))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the),
% nbar(n(chair))), pp(prep(in), np(det(a), nbar(n(room)), pp(prep(in),
% np(det(...), nbar(...))))))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the),
% nbar(n(chair)), pp(prep(in), np(det(a), nbar(n(...))))), pp(prep(in),
% np(det(the), nbar(n(room)))))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the),
% nbar(n(chair)), pp(prep(in), np(det(a), nbar(n(...))), pp(prep(in),
% np(det(...), nbar(...))))))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) ;
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the),
% nbar(n(chair)), pp(prep(in), np(det(a), nbar(n(...)), pp(prep(...),
% np(..., ...))))))))), vp(v(sees), np(det(the), nbar(jp(adj(red),
% n(apples))), pp(prep(under), np(det(the), nbar(n(chair))))))) ;
%false.
