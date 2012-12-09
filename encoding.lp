%%%%%%%%%%%%
% provide data

% bachelor's projects
% project(P,MIN,MAX).

% what the students select for
% select(S,P,N).

%%%%%%%%%%%%
% helpers

student(S) :- select(S,_,_).

select(S,P) :- select(S,P,_).

assign(S,P,N) :- assign(S,P), select(S,P,N).

%%%%%%%%%%%%
% generate

% assign students to projects
MIN { assign(S,P): select(S,P)} MAX :- project(P,MIN,MAX).


%%%%%%%%%%%%
% test

% one project per student
:- student(S),  not 1 { assign(S,P) } 1.


%%%%%%%%%%%%
% optimize

penalize(S,ZZ-Z,N-1) :- assign(S,P), select(S,P,N), penalty(N-1,Z), penalty(N,ZZ).
penalize(S,ZZ-Z,N-1) :- penalize(S,_,N), 1<N, penalty(N-1,Z), penalty(N,ZZ).

% optimize the assignment
#minimize [ penalize(_,D,_) = D, student(_) ].


%%%%%%%%%%%%
% print

#hide.
#show assign/3.