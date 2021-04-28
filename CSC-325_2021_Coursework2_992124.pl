%My code covers animacy as well.
s(s(NP,VP)) --> np(NP,SP,P,subject,A),vp(VP,SP,P,_,A).
np(np(DET,NBAR),SP,_,_,A) --> det(DET,SP),nbar(NBAR,SP,A).
np(np(PRO),SP,P,SO,_) --> pro(PRO,SP,P,SO).
np(np(DET,NBAR,PP),SP,_,_,A)-->det(DET,SP),nbar(NBAR,SP,A),pp(PP,_,_,_).
nbar(nbar(N),SP,A) -->n(N,SP,A).
nbar(nbar(JPA),SP,A) --> jp(JPA,SP,A).

pp(pp(PREP,NP,PPB),_,_,_)-->prep(PREP),np(NP,_,_,object,_),pp(PPB,_,_,_).
pp(pp(PREP,NP),_,_,_)-->prep(PREP),np(NP,_,_,objec,_).

jp(jp(JPA,JPB),SP,A) --> adj(JPA),jp(JPB,SP,A).
jp(jp(JPA,N),SP,A) -->adj(JPA),n(N,SP,A).

vp(vp(V,NP),SP,P,_,A) --> v(V,tv,SP,P,A),np(NP,_,_,object,_).
vp(vp(V),SP,P,_,A) --> v(V,iv,SP,P,A).



pro(pro(Word),SP,P,SO)-->[Word],{lex(Word,pro,SP,P,SO)}.
v(v(Word),V,SP,P,A)-->[Word],{lex(Word,V,SP,P,A)}.

det(det(Word),SP) --> [Word], {lex(Word,det,SP)}.
n(n(Word),SP,A) --> [Word], {lex(Word,n,SP,A)}.

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
lex(know,tv,singular,1,animate).
lex(know,tv,singular,2,animate).
lex(knows,tv,singular,3,animate).
lex(know,tv,plural,_,animate).
lex(see,tv,singular,1,animate).
lex(see,tv,singular,2,animate).
lex(sees,tv,singular,3,animate).
lex(see,tv,plural,_,animate).
lex(hire,tv,singular,1,animate).
lex(hire,tv,singular,2,animate).
lex(hires,tv,singular,3,animate).
lex(hire,tv,plural,_,animate).
lex(fall,iv,singular,1,_).
lex(fall,iv,singular,2,_).
lex(falls,iv,singular,3,_).
lex(fall,iv,plural,_,_).
lex(sleep,iv,singular,1,animate).
lex(sleep,iv,singular,2,animate).
lex(sleeps,iv,singular,3,animate).
lex(sleep,iv,plural,_,animate).


%Determiner
lex(the,det,_).
lex(a,det,singular).
lex(two,det,plural).




%Noun
lex(man,n,singular,animate).
lex(woman,n,singular,animate).
lex(apple,n,singular,inanimate).
lex(chair,n,singular,inanimate).
lex(room,n,singular,inanimate).
lex(men,n,plural,animate).
lex(women,n,plural,animate).
lex(apples,n,plural,inanimate).
lex(chairs,n,plural,inanimate).
lex(rooms,n,plural,inanimate).

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
% ?- s(T,[the,woman,sees,the,apples],[]).
%T = s(np(det(the),nbar(n(woman))), vp(v(sees), np(det(the), nbar(n(apples))))) .

%2
%?- s(T,[a,woman,knows,him],[]).
%T = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him)))) .

%3
%?- s(T,[two,woman,hires,a,man],[]).
%false.

%4
%?- s(T,[two,women,hire,a,man],[]).
% T = s(np(det(two), nbar(n(women))), vp(v(hire), np(det(a),
% nbar(n(man))))) .

%5
%?- s(T,[she,knows,her],[]).
%T = s(np(pro(she)), vp(v(knows), np(pro(her)))) .

%6
%
%?- s(T,[she,know,the,man],[]).
%false.

%7
%?- s(T,[us,see,the,apple],[]).
%false.

%8
%?- s(T,[we,see,the,apple],[]).
%T = s(np(pro(we)), vp(v(see), np(det(the), nbar(n(apple))))) .

%9
%?- s(T,[i,know,a,short,man],[]).
% T = s(np(pro(i)), vp(v(know), np(det(a), nbar(jp(adj(short),
% n(man)))))) .

%10
%?- s(T,[he,hires,they],[]).
%false.

%11
%?- s(T,[two,apples,fall],[]).
%T = s(np(det(two), nbar(n(apples))), vp(v(fall))) .

%12
%?- s(T,[the,apple,falls],[]).
%T = s(np(det(the), nbar(n(apple))), vp(v(falls))) .

%13
%?- s(T,[the,apples,fall],[]).
%T = s(np(det(the), nbar(n(apples))), vp(v(fall))) .

%14
%?- s(T,[i,sleep],[]).
%T = s(np(pro(i)), vp(v(sleep))) .

%15
%?- s(T,[you,sleep],[]).
%T = s(np(pro(you)), vp(v(sleep))) .

%16
%?- s(T,[she,sleeps],[]).
%T = s(np(pro(she)), vp(v(sleeps))) ;

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
% n(woman))))))) .

%22
%?- s(T,[a,man,tall,knows,the,short,woman],[]).
%false.

%23
%?- s(T,[a,man,on,a,chair,sees,a,woman,in,a,room],[]).
% T = s(np(det(a), nbar(n(man)), pp(prep(on), np(det(a),
% nbar(n(chair))))), vp(v(sees), np(det(a), nbar(n(woman)), pp(prep(in),
% np(det(a), nbar(n(room))))))) .

%24
%?- s(T,[a,man,on,a,chair,sees,a,woman,a,room,in],[]).
%false.

% 25
% ?-
% s(T,[the,tall,young,woman,in,a,room,on,the,chair,in,a,room,in,the,room,see%s,the,red,apples,under,the,chair],[]).
% T = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))),
% pp(prep(in), np(det(a), nbar(n(room))), pp(prep(on), np(det(the),
% nbar(n(chair))), pp(prep(in), np(det(a), nbar(n(room))), pp(prep(in),
% np(det(the), nbar(n(room)))))))), vp(v(sees), np(det(the),
% nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the),
% nbar(n(chair))))))) .

%26
%?- s(T,[the,woman,sees,the,apples],[]).
% T = s(np(det(the), nbar(n(woman))), vp(v(sees), np(det(the),
% nbar(n(apples))))) .

%27
%?- s(T,[a,woman,knows,him],[]).
%T = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him)))) .

%28
%?- s(T,[a,man,sleeps],[]).
%T = s(np(det(a), nbar(n(man))), vp(v(sleeps))) .

%29
%?- s(T,[the,room,sleeps],[]).
%false.

%30
%?- s(T,[the,apple,sees,the,chair],[]).
%false.

%31
%?- s(T,[the,room,knows,the,man],[]).
%false.


%32
%?- s(T,[the,apple,falls],[]).
%T = s(np(det(the), nbar(n(apple))), vp(v(falls))) .

%33
%?- s(T,[the,man,falls],[]).
%T = s(np(det(the), nbar(n(man))), vp(v(falls))) .
