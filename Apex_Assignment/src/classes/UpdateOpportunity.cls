public class UpdateOpportunity {
    public static void UpdateManagerOfOpportunity(List<Opportunity> opportunityList){
        
        List<Opportunity> opList = [Select id,name,BillToContact__c,Manager__c From Opportunity Where id in :opportunityList AND BillToContact__C != null
                                   And manager__C = null];
        
        for (Opportunity oop: opList){
           System.debug(oop.Id);
           Contact con = [Select account.id from contact where id = :oop.BillToContact__c];
          oop.Manager__c = con.AccountId;
          update(oop);
   		 }
    }
}