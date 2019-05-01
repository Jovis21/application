%To Start the system type start. 
/* This is to certify that we have completed the assignment on our own; we therefore did not copy the code elsewhere and claim it to be ours.  
Our group member are Lew Chin Leng (244715)  Koh Sin Er (245839)  Chuah Pei Sin (245001), we are choosed expert system as our topic which called "Travel Package Recommender" 
This recommender system is based on user's reuqirement (inbound or outbound travel package, budget and theme of travel package) to identify appropiate travel package to user.
REMARK: 1. THIS .PL file only can run in swi-prolog for show the system interface */ 

%The system start with enter user's name. Then begin the simple query: User answer Y->Y->->Y, this system will output "We are recommend you travel package : 1 day in Cameron Highland (RM125)".
/*Based on difference answer (y/n) for every question, to identify requirement of user, then output appropiate trave package for user.*/

:- use_module(library(jpl)).
start :-sleep(0.4),
		write('-----------------------------------------------------------------'),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.2),
		write("###############||| TRAVEL PACKAGE RECOMMENDER |||################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write('-----------------------------------------------------------------'),nl,nl,nl,




		interface2.
       

    option(Customer,inbound) :- 
	verify(Customer," prefer inbound travel package(y/n) ?").

    option(Customer,outbound) :- 
	verify(Customer," prefer outbound travel package(y/n) ?").

    option(Customer,less_InboundBudget) :- 
	verify(Customer," has less budget (less than RM400) for inbound travel package (y/n) ?").

    option(Customer,more_InboundBudget) :- 
	verify(Customer," has more budget (more than RM400) for inbound travel package (y/n) ?").

    option(Customer,less_OutboundBudget) :- 
	verify(Customer," has less budget (less than RM2000) for outbound travel package (y/n) ?").

    option(Customer,more_OutboundBudget) :- 
	verify(Customer," has more budget (more than RM2000) for outbound travel package (y/n) ?").

    option(Customer,leisure) :- 
	verify(Customer," prefer leisure travel package (y/n) ?").

    option(Customer,adventure) :- 
	verify(Customer," prefer adventure travel package(y/n) ?").
    option(Customer,civilization) :- 
	verify(Customer," prefer civilization travel package(y/n) ?").


    
travelPackage(Customer,"1 Day in Cameron Highland (RM125)"):-
     option(Customer,inbound),
     option(Customer,less_InboundBudget),
     option(Customer,leisure).

travelPackage(Customer,"1 Day in Penang Escape Park with ticket (RM100)"):-
     option(Customer,inbound),
     option(Customer,less_InboundBudget),
     option(Customer,adventure).

travelPackage(Customer,"3D2N in Penang Culture Tour (RM350)") :-
     option(Customer,inbound), 
     option(Customer,less_InboundBudget), 
     option(Customer,civilization).

travelPackage(Customer,"3D2N in Island Redang (RM525)") :-
      option(Customer,inbound),
      option(Customer,more_InboundBudget),
      option(Customer,leisure).

travelPackage(Customer,"3D2N in Langkahwi (RM450)"):-
      option(Customer,inbound),
      option(Customer,more_InboundBudget),
      option(Customer,adventure).

   
travelPackage(Customer,"3D2N in Malacca A-Famosa (RM500)") :-
      option(Customer,inbound),
      option(Customer,more_InboundBudget),
      option(Customer,civilization).

    
travelPackage(Customer,"3D2N in Krabi Isaland (RM600)") :-
      option(Customer,outbound),
      option(Customer,less_OutboundBudget),
      option(Customer,leisure).

travelPackage(Customer,"3D2N in China ZhangJiaJie (RM1700)"):-
     option(Customer,outbound),
     option(Customer,less_OutboundBudget),
     option(Customer,adventure).

travelPackage(Customer,"3D2N in China Beijing (RM1800)"):-
     option(Customer,outbound),
     option(Customer,less_OutboundBudget),
     option(Customer,civilization).

travelPackage(Customer,"3D2N in Maldives (RM2275)"):-
     option(Customer,outbound),
     option(Customer,more_OutboundBudget),
     option(Customer,leisure).

travelPackage(Customer,"3D2N in India Himalaya (RM2500)"):-
     option(Customer,outbound),
     option(Customer,more_OutboundBudget),
     option(Customer,adventure).


travelPackage(Customer,"5D4N in Egypt (RM7000)"):-
     option(Customer,outbound),
     option(Customer,more_OutboundBudget),
     option(Customer,civilization).



travelPackage(_,"Sorry =T.T=, we doesnt have travel package is fullfill your requirement.").

response(Reply) :-
        read(Reply),
        write(Reply),nl.

ask(Customer,Question) :-
	write(Customer),write(', do you'),write(Question),
	/*read(N),
	( (N == yes ; N == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail),*/

	interface(', do you',Customer,Question),
	write('Loading.'),nl,
	sleep(1),
	write('Loading..'),nl,
	sleep(1),
	write('Loading...'),nl,
	sleep(1),
    nl.

:- dynamic yes/1,no/1.

verify(P,S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(P,S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.


pt(Customer):-

		travelPackage(Customer,TravelPackage),
		interface3(Customer,', We are recommended you travel package: ',TravelPackage,'.'),
                write(Customer),write(', We are recommend you travel package: '),write(TravelPackage),write('.'),undo,end.

end :-
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("##########||| HAVE A NICE DAY, THANK YOU FOR USE ME |||##########"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- Travel Package Recommender ---'],LBL),
	jpl_new('javax.swing.JLabel',['!! The price of every packages are only included:'],LBLL),
	jpl_new('javax.swing.JLabel',['transport, accommodation and breakfast.'],LBLB),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(Pan,add,[LBLL],_),
	jpl_call(Pan,add,[LBLB],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _),
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).

interface2 :-
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- Travel Package Recommender ---'],LBL),
	jpl_new('javax.swing.JLabel',['!! The price of every packages are only included:'],LBLL),
	jpl_new('javax.swing.JLabel',['transport, accommodation and breakfast.'],LBLB),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(Pan,add,[LBLL],_),
	jpl_call(Pan,add,[LBLB],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Welcome, What is your name?'], N),
	jpl_call(F, dispose, [], _),
	/*write(N),nl,*/
	(	N == @(null)
		->	write('You cancelled'),interface3('You cancelled. ','Thank you ','for use ','me.'),end,fail
		;	write("Welcome, what is your name : "),write(N),nl,pt(N)
	).


interface3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- Travel Package Recommender ---'],LBL),
	jpl_new('javax.swing.JLabel',['!! The price of every packages are only included:'],LBLL),
	jpl_new('javax.swing.JLabel',['transport, accommodation and breakfast.'],LBLB),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(Pan,add,[LBLL],_),
	jpl_call(Pan,add,[LBLB],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _),
	/*write(N),nl,*/
	(	N == @(void)
		->	write('')
		;	write("")
	).

help :- write("To start the expert system please type 'start.' and press Enter key").
