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
np(np(DET,N),SP,_,_) --> det(DET,SP),n(N,SP).
np(np(PRO),SP,P,SO) --> pro(PRO,SP,P,SO).
vp(vp(V,NP),SP,P,_) --> v(V,tv,SP,P),np(NP,_,_,_).
vp(vp(V,NP),SP,P,_) --> v(V,tv,SP,P),np(NP,_,_,_).

vp(vp(V,PRO),SP,P,_) --> v(V,tv,SP,P),np(PRO,_,_,object).

vp(vp(V),SP,_,_) --> v(V,iv,SP,_).



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





