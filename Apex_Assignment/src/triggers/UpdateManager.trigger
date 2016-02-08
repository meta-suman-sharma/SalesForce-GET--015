trigger UpdateManager on Opportunity (after update) {
	List<Opportunity> opportunityList = new List<Opportunity>();
    for (Opportunity oop: Trigger.New){
            opportunityList.add(oop);    
    }
    UpdateOpportunity.UpdateManagerOfOpportunity(opportunityList);
}