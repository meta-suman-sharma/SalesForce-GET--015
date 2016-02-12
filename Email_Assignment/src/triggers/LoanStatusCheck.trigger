trigger LoanStatusCheck on Loan__c (after update) {
    List<Id> recieverIds = new List<Id>();
    //Get The email template
    EmailTemplate eTemp = [select id,name from EmailTemplate where name ='Loan Status Alert' and isActive = true Limit 1];
    //Iterate updated loans
    for (Loan__c updatedLoan: Trigger.New){
        //get Old loans
        Loan__c oldLoan = Trigger.oldMap.get(updatedLoan.Id); 
        //check wether status is changed to approved/rejected or not
        if(oldLoan.Loan_status__c!=updatedLoan.Loan_status__c && updatedLoan.Loan_status__c != 'Submitted'){
            //add loan owner ids to reciver list
            recieverIds.add(oldLoan.OwnerId);
            //send mail 
            SendMailOnStatusChange.sendEmail(recieverIds,eTemp);
        }
    }
}
