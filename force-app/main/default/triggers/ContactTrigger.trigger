trigger ContactTrigger on Contact (before update, before insert) {
    for(Contact contact: Trigger.new){
        if(trigger.isUpdate){
        contact.description='Contact updated by '+userinfo.getUserName();
        }
           else if(trigger.isInsert){
             contact.description='Contact Created by Sanjay';   
           }
    }

}