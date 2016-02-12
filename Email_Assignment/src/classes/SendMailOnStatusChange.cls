public class SendMailOnStatusChange {
	//method for sending Mass mail
	public static void SendEmail(List<Id> receiver,EmailTemplate eTemp)
    {
       Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
       //set reciever list
       mail.setTargetObjectIds(receiver);
       //set email template
       mail.setTemplateId(eTemp.Id);
       mail.setSaveAsActivity(false);
       //send mail in mass
       Messaging.sendEmail(new Messaging.MassEmailMessage[] {mail});   
    }
}
