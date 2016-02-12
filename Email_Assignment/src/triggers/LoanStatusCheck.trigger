trigger LoanStatusCheck on Loan__c (after update) {
	List<Id> recieverIds = new List<Id>();
    EmailTemplate eTemp = [select id,name from EmailTemplate where name ='Loan Status Alert' and isActive = true Limit 1];
    
    for (Loan__c updatedLoan: Trigger.New){
        Loan__c oldLoan = Trigger.oldMap.get(updatedLoan.Id);       
        if(oldLoan.Loan_status__c!=updatedLoan.Loan_status__c && updatedLoan.Loan_status__c != 'Submitted'){
           recieverIds.add(oldLoan.OwnerId);    
           SendMailOnStatusChange.sendEmail(recieverIds,eTemp);
        }
    }
 }