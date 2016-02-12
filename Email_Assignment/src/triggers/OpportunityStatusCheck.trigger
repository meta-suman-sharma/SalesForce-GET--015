trigger OpportunityStatusCheck on Opportunity (after update) {

    List<Id> recieverIds = new List<Id>();
    EmailTemplate eTemp = [select id,name from EmailTemplate where name ='Opportunity status Alert' and isActive = true Limit 1];
    
    for (Opportunity updatedOpportunity: Trigger.New){
        Opportunity oldOpportunity = Trigger.oldMap.get(updatedOpportunity.Id);       
        if(oldOpportunity.Status__c != updatedOpportunity.Status__c){
           recieverIds.add(oldOpportunity.OwnerId);    
           SendMailOnStatusChange.sendEmail(recieverIds,eTemp);
        }
    }
}