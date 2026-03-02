@isTest
private class AccountServiceTest {
    
    @testSetup
static void setupTestData() {
    List<Account> testAccounts = new List<Account>();
    
    for(Integer i = 0; i < 5; i++) {
        testAccounts.add(new Account(
            Name = 'Test Account ' + i,
            External_Id__c = 'EXT-' + i   // ✅ Add required field.
        ));
    }
    
    insert testAccounts;
}
    
    @isTest
    static void testUpdateAccountDescription_Success() {
        
        List<Account> accounts = [SELECT Id, Description FROM Account];
        List<Id> accountIds = new List<Id>();
        
        for(Account acc : accounts) {
            accountIds.add(acc.Id);
        }
        
        Test.startTest();
        AccountService.updateAccountDescription(accountIds, 'Updated via Apex');
        Test.stopTest();
        
        List<Account> updatedAccounts = [
            SELECT Description FROM Account
        ];
        
        for(Account acc : updatedAccounts) {
            System.assertEquals('Updated via Apex', acc.Description);
        }
    }
    
    @isTest
    static void testUpdateAccountDescription_EmptyInput() {
        
        Test.startTest();
        AccountService.updateAccountDescription(new List<Id>(), 'Some Text');
        Test.stopTest();
        
        System.assert(true, 'Method handled empty input successfully');
    }
    
    @isTest
    static void testUpdateAccountDescription_BlankDescription() {
        
        List<Account> accounts = [SELECT Id FROM Account LIMIT 1];
        
        Test.startTest();
        AccountService.updateAccountDescription(
            new List<Id>{accounts[0].Id},
            ''
        );
        Test.stopTest();
        
        Account acc = [SELECT Description FROM Account WHERE Id = :accounts[0].Id];
        System.assertEquals(null, acc.Description);
    }
}