trigger OpportunityActions on Opportunity (after insert) {
AccountActionHandler.OpportunityUpdate(trigger.new);
}