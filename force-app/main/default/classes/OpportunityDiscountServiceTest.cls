@isTest
private class OpportunityDiscountServiceTest {

    @testSetup
    static void setupData() {
        
        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;
        
        List<Opportunity> oppList = new List<Opportunity>{
            
            // High value (>100000)
            new Opportunity(
                Name = 'High Value Opp',
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(10),
                Amount = 150000,
                AccountId = acc.Id
            ),
            
            // Medium value (>=50000)
            new Opportunity(
                Name = 'Medium Value Opp',
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(10),
                Amount = 75000,
                AccountId = acc.Id
            ),
            
            // Low value (<50000)
            new Opportunity(
                Name = 'Low Value Opp',
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(10),
                Amount = 20000,
                AccountId = acc.Id
            ),
            
            // Null amount case
            new Opportunity(
                Name = 'Null Amount Opp',
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(10),
                AccountId = acc.Id
            )
        };
        
        insert oppList;
    }

    @isTest
    static void testApplyDiscount_AllScenarios() {
        
        List<Opportunity> opps = [
            SELECT Id FROM Opportunity
        ];
        
        List<Id> oppIds = new List<Id>();
        for(Opportunity o : opps) {
            oppIds.add(o.Id);
        }
        
        Test.startTest();
        OpportunityDiscountService.applyDiscount(oppIds);
        Test.stopTest();
        
        List<Opportunity> updatedOpps = [
            SELECT Name, Amount, Discount__c
            FROM Opportunity
        ];
        
        for(Opportunity opp : updatedOpps) {
            
            if(opp.Name == 'High Value Opp') {
                System.assertEquals(15000, opp.Discount__c);
            }
            else if(opp.Name == 'Medium Value Opp') {
                System.assertEquals(3750, opp.Discount__c);
            }
            else if(opp.Name == 'Low Value Opp') {
                System.assertEquals(0, opp.Discount__c);
            }
            else if(opp.Name == 'Null Amount Opp') {
                System.assertEquals(null, opp.Discount__c);
            }
        }
    }

    @isTest
    static void testApplyDiscount_EmptyInput() {
        
        Test.startTest();
        OpportunityDiscountService.applyDiscount(new List<Id>());
        Test.stopTest();
        
        System.assert(true);
    }
}