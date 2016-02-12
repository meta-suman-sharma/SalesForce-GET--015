public class SendMailOnStatusChange {
	public static void SendEmail(List<Id> receiver,EmailTemplate eTemp)
    {
       Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
       mail.setTargetObjectIds(receiver);
       mail.setTemplateId(eTemp.Id);
       mail.setSaveAsActivity(false);
       Messaging.sendEmail(new Messaging.MassEmailMessage[] {mail});   
    }
}