trigger ContactBeforeUpdateTrigger on Contact (before update) {
// Trigger.New hold new version of Contacts @testvar@
for(Contact contact: Trigger.new){
contact.Description = 'Contact updated successfully by '+ userInfo.getUserName() ;
}
// No Need to write DML statement, trigger. New will be take care.
}