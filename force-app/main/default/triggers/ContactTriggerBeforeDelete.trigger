trigger ContactTriggerBeforeDelete on Contact (before delete) {
    for(Contact c: trigger.old){
        if(c.accountId==null){
            c.addError('Hey!! there is no account associated with the contact. Hence we cannot delete this contact.Thanks!!');
        }
    }

}