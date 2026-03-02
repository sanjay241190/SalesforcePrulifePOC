public with sharing class AccountService {
    
    /**
     * Updates the Description field of Accounts..
     * @param accountIds List of Account record Ids
     * @param descriptionText Text to be updated
     */
    public static void updateAccountDescription(List<Id> accountIds, String descriptionText) {
        
        if(accountIds == null || accountIds.isEmpty()) {
            return;
        }
        
        if(String.isBlank(descriptionText)) {
            return;
        }
        
        List<Account> accountsToUpdate = [
            SELECT Id, Description
            FROM Account
            WHERE Id IN :accountIds
        ];
        
        for(Account acc : accountsToUpdate) {
            acc.Description = descriptionText;
        }
        
        if(!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}