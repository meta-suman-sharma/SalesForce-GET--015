/*
* Trigger will check before insert and update if the subject list contaings hindi then not allow to insert or update.
*/
trigger ForbidHindiTeacherToInsertUpdate on Contact (before insert,before update) {
    for(Contact contact: Trigger.New) {
        try{
            if(Contact.Subjects__c.contains('Hindi')){
                contact.addError('Hindi Teacher deatil can not updated');
            }
        }catch(NullPointerException e){
            contact.addError('Please Select atleast oNe Subject (NullPointer Exception)');
        }  
    }
}