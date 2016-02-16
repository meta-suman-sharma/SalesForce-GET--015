/*
* Trigger will check before update if the opportunity Stage Name is updated to  'Closed Won' or 'Closed Lost' 
* then populates the Close Date field with Today(). 
*/
trigger UpdateCloseDateInOpportunity on Opportunity (before update) {
    for(Opportunity opportunity: Trigger.new){
        Opportunity oldOpp = Trigger.oldMap.get(opportunity.Id);
        
        if((opportunity.StageName == 'Closed Won' && oldOpp.StageName != 'Closed Won') || (opportunity.StageName == 'Closed Lost' && oldOpp.StageName != 'Closed Lost')){
            opportunity.CloseDate = Date.today();
        }
    }
}