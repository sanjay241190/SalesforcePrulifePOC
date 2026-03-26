public with sharing class OpportunityDiscountService {

    public static void applyDiscount(List<Id> opportunityIds) {
        
        if(opportunityIds == null || opportunityIds.isEmpty()) {
            return;
        }
        
        List<Opportunity> opps = [
            SELECT Id, Amount, Discount__c
            FROM Opportunity
            WHERE Id IN :opportunityIds
        ];
        
        for(Opportunity opp : opps) {
            
            if(opp.Amount == null) {
                continue;
            }
            
            if(opp.Amount > 100000) {
                opp.Discount__c = opp.Amount * 0.10;
            }
            else if(opp.Amount >= 50000) {
                opp.Discount__c = opp.Amount * 0.05;
            }
            else {
                opp.Discount__c = 0;
            }
        }
        
        if(!opps.isEmpty()) {
            update opps;
        }
    }
}