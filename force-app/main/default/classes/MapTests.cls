public class MapTests {
    
    public static void CheckMap(){
        List<account> lst=[select Name,NumberOfEmployees from account where NumberOfEmployees=20];
       // System.debug(lst);        
        Map<id,account> mp=new Map<id,account>();
          for(Account a : lst){
            mp.put(a.id,a);    
           }
        Map<account,List<Contact>> mymap=new Map<account,List<Contact>>();
           for(Account a:lst){
             List<Contact> con=[select LastName from Contact where Contact.AccountId=:a.id ];
             mymap.put(a,con);  
             System.debug(a.name +' '+mymap.get(a));
        }
    }
}