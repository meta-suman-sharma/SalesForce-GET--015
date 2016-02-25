/*
* controller which will set value of BillToContact__c from available contacts related to manager.
*/
public with sharing class CustomLookupController {
	/* To get opportunity */
    public Opportunity opportunity{get;set;}
    /* Contact id which is selected to set as BillToContact__c */
    public Id contactId{get;set;}
    /* List of all contacts related to manager */
    public List<Contact> contactList{get;set;}
    /*
    * constructor initializes the member variable by using the getRecord method from the standard controller.
    */
    public CustomLookupController(ApexPages.StandardController stdController) {
        this.opportunity = (Opportunity)stdController.getRecord();
        this.contactList=[SELECT Id, Name FROM Contact where Contact.AccountID=:opportunity.Manager__c];
    }
    
    /*
    * Function returns all the selectOption which is contact list related to manager
    * return : List<SelectOption> : list of contacts
    */
    public List<SelectOption> getItems(){
        List<SelectOption> options=new List<SelectOption>();
        for(Contact contact : contactList)
            options.add(new SelectOption(contact.Id,contact.Name));
        return options;
    }
     /*
    * function sets selected contact by radio button as BillToContact__c
    */ 
    public void setManager(){
        update opportunity;
    }
    /*
    * function clears BillToContact__c field if any value is present there.
    */ 
    public void removeManager(){
        opportunity.BillToContact__c = null;
        update opportunity;
    }
}