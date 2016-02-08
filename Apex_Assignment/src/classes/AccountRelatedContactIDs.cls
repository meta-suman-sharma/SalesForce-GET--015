public class AccountRelatedContactIDs {
    public static void addRelatedContactIDsToAccount(String id){
        Contact accForContactID = [Select id,account.id from contact where id=:id];
      	Account allContactsforAcc = [Select id,ContactIDs__c from account where id=:accForContactID.account.id];
        string contactIds = '';
        Boolean flag = false;
       	if(allContactsforAcc.ContactIDs__c==null){
           List<Contact> accContact = [Select id from contact where account.id=:accForContactID.account.id];
           Integer count = 1;
           for(Contact con : accContact){
               if(count==1){
                  contactIds = contactIds + con.id;
               }
               else{
                   contactIds = contactIds + ','+con.id;
               }
               count++;
      	 }    
       }
        else{
           
            String[] arrTest = allContactsforAcc.ContactIDs__c.split('\\,');
            for(Integer j=0; j<arrTest.size();j++){
                if(arrTest[j]==accForContactID.id){
                    flag=True;
                    break;
                }
            }

               contactIds = allContactsforAcc.ContactIDs__c;
           }
         if(flag==false){
            contactIds = contactIds+','+accForContactID.id;
       }      
           allContactsforAcc.ContactIDs__c = contactIds;
           update allContactsforAcc;
   }
}