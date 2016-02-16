/*
* Trigger will check before update if the Custom_Status__c is Reset then delete all the entries related to the product. 
*/
trigger DeleteOpportunityLineItemOnReset on Opportunity (after update) {
    Set<Id> opportunityIds = new Set<Id>();
    for(Opportunity opportunity: Trigger.new){
        if(opportunity.Custom_Status__c == 'Reset' && opportunity.Custom_Status__c != Trigger.OldMap.get(opportunity.Id).Custom_Status__c) {
            opportunityIds.Add(opportunity.id);
        }
    }
    if (opportunityIds.size() > 0) {
        List<OpportunityLineItem> opportunityLineItems = [select id from OpportunityLineItem where Opportunity.Id IN :opportunityIds];
        Database.delete(opportunityLineItems);
    }
}