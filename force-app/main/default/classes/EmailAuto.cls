public class EmailAuto {
    public static void sendNotificationMail(String OrdNo){
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setSenderDisplayName('Company Support'); 
        message.setReplyTo('no-reply@company.com');
        message.setUseSignature(false); 
        message.setBccSender(false); 
        message.setSaveAsActivity(false);        
        Order ema = [select contact__r.id,contact__r.market__c,contact__r.email from order where ordernumber=:OrdNo];//00000100
        String emailtemp='';
        if(ema.contact__r.market__c=='Spain'){
            emailtemp='Test Email Template';
        }        
        EmailTemplate emailTemplate = [Select Id,Subject,DeveloperName,Body from EmailTemplate where name =:emailtemp];
        message.setTemplateID(emailTemplate.Id);
        String ans= ema.contact__r.email;
        message.setTargetObjectId(ema.Contact__r.id);
        message.toAddresses=new String[]{ans};
            Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
                Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        System.debug(results);
        if (results[0].success) 
        {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: ' +  results[0].errors[0].message);
        }
    }    
    
}