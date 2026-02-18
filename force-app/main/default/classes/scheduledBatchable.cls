global class scheduledBatchable implements Schedulable {
   global void execute(SchedulableContext sc) {
      BatchApexAccounts b = new BatchApexAccounts(); 
      Database.executeBatch(b);
   }
}