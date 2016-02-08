public class GetStudentsOfAClass {
   public static List<student__c> getStudentOfClassByClassID(String id)
   {
       List<student__c> students=[select name from student__c where class__r.id=:id];
       return students;
   }
    
    public static Map<Id,List<student__c>> getStudentOfClass()
   {
       Map<Id,List<student__c>> info=new Map<Id,List<student__c>>();
       for(class__c element :  [select id,(select id from students__r) From class__c])
       {
           info.put(element.Id,element.students__r);
       }
       return info;
   }
}