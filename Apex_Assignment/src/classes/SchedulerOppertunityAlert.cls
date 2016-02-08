public class SchedulerOppertunityAlert implements Schedulable{
	 public static void execute(SchedulableContext  sc)
   {       
       DateTime todayDate = DateTime.Now();
       Datetime lastMonthDate = todayDate.addDays(-30) ;
       List<Id> recieverIdList = new List<Id>();
       for(Opportunity opportunity : [Select id, Owner.id From Opportunity where LastModifiedDate < :lastMonthDate])
       {
   		  recieverIdList.add(opportunity.Owner.id);
       }
       if(recieverIdList.size()>0)
       {
       		SendEmail(recieverIdList);
       }
   }
   
   public static void SendEmail(List<Id> recieverIdList) 
   {
       Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
       mail.setTargetObjectIds(recieverIdList);
       mail.setTemplateID('00X28000000chVm');
       mail.setSaveAsActivity(false);
       Messaging.sendEmail(new Messaging.MassEmailMessage[] {mail});   
	}
}