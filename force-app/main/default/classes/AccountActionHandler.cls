public class AccountActionHandler {
    public static void AccountUpdate(List<Account> accounts)
    {
        List<Contact> liscon=new List<Contact>();
    for(Account acc:accounts){
        Contact con=new Contact();
        con.AccountID=acc.Id;
        con.LastName=acc.Name;
        liscon.add(con);
    }
    if(!liscon.isEmpty()){
        Insert liscon;
    }
    }
    
    public static void OpportunityUpdate(List<Opportunity> oppty){
        List<Case> cases=new List<Case>();
    for (Opportunity opp: oppty){
        Case addCase=new Case();
        addCase.AccountId=opp.AccountId;
        addCase.OwnerId=opp.OwnerId;
        addCase.Subject=opp.Name;
        cases.add(addCase);
    }
    if(!cases.isEmpty())
    {
        Insert cases;
    }
    }
    
    public static void OpportunityCreate(Map<id,Account> newAccountMap, Map<id,Account> oldAccountMap){
        List<Opportunity> lstopp=new List<Opportunity>();
        for(Account acc:newAccountMap.values()){
            if(newAccountMap.get(acc.Id).Rating!=oldAccountMap.get(acc.Id).Rating && newAccountMap.get(acc.Id).Rating=='Warm'){
                Opportunity opty=new Opportunity();
                opty.AccountId=acc.Id;
                opty.Name=acc.Name;
                opty.StageName='Prospecting';
                opty.CloseDate=system.today();
                lstopp.add(opty);
            }
        }
            if(!lstopp.isEmpty()){          
                    Insert lstopp;
            
        }
    }
}