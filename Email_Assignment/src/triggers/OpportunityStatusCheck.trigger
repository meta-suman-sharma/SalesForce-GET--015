trigger OpportunityStatusCheck on Opportunity (after update) {
    List<Id> recieverIds = new List<Id>();
    //Get The email template
    EmailTemplate eTemp = [select id,name from EmailTemplate where name ='Opportunity status Alert' and isActive = true Limit 1];
    //Iterate updated updated Opportunities
    for (Opportunity updatedOpportunity: Trigger.New){
        //get Old Opportunities
        Opportunity oldOpportunity = Trigger.oldMap.get(updatedOpportunity.Id); 
        //check wether status is changed or not
        if(oldOpportunity.Status__c != updatedOpportunity.Status__c){
            //add loan owner ids to reciver list
            recieverIds.add(oldOpportunity.OwnerId);  
            //send mail
            SendMailOnStatusChange.sendEmail(recieverIds,eTemp);
        }
    }
}
