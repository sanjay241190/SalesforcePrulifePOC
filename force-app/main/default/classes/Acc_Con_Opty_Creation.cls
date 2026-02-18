Public class Acc_Con_Opty_Creation
{
Public Account CreateAccount(String n)
{
Account a = new Account(); a.Name='n';
insert a;
Contact c = new Contact(); c.LastName='Satti Reddy';
c.AccountId=a.id;
insert c;
Opportunity opp= new Opportunity(); opp.Name='Test Opportunity';
return null;
}
}