public with sharing class ReturnContacts {
    @AuraEnabled
    public static List<Contact> getContacts(){
        return [select id, Name from Contact LIMIT 10];
    }
}