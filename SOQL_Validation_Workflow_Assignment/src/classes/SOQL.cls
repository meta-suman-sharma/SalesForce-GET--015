public class SOQL {
	List<student__c> students1=[Select Name,DOB__c,Sex__c from student__c where LastName__c LIKE 'S%'];
    List<student__c> students2=[Select Name from student__c where class__r.Name  LIKE 'x%'];
    List<student__c> students3=[Select Name,class__r.Name  from student__c];
    List<Sobject> students4=[SELECT Name, (SELECT Name FROM students__r) FROM class__c];
    List<Sobject> students5=[Select Name from student__c where class__r.ClassTeacher__r.Name LIKE 's%'];
    List<Sobject> students6=[Select Name from student__c where Calendar_Year(DOB__c)>2000];
    List<Sobject> students7=[Select Name from lead where LastModifiedDate = THIs_Month];
    List<Sobject> students8=[SELECT Id, Name,(SELECT Name FROM Students__r ) FROM Class__c WHERE id IN (SELECT Class__c FROM Student__c WHERE Name LIKE 'S%')];
    List<Sobject> students9=[Select Name from contact where Subjects__c INCLUDES ('Hindi;English')];
    List<Sobject> students10=[Select Name from contact where Subjects__c INCLUDES ('Hindi','English')];
	
    
}