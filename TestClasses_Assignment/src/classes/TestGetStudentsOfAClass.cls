@isTest
public class TestGetStudentsOfAClass {
     @isTest static void testgetStudentOfClassByClassIDMethod(){
         List<student__c> expected=[Select name From Student__c where class__r.id = 'a0J28000000WAvp'];
             
         List<student__c> actual=GetStudentsOfAClass.getStudentOfClassByClassID('a0J28000000WAvp');
        System.assertEquals(expected, actual);
       }
    
    @isTest static void testgetStudentOfClassMethod(){
         Map<Id, List<student__C>> expected = new Map<Id, List<student__C>>();
         for(class__c parent : [select id,(select id from students__r) From class__c]) {
           expected.put(parent.Id, parent.students__r);
         }
             
        Map<Id,List<student__c>> actual=GetStudentsOfAClass.getStudentOfClass();
        System.assertEquals(expected, actual);
       }
}