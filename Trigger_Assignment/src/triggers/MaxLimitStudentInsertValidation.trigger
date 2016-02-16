/*
* Trigger will check before insert student if class has reached to its maximum limit then not allow insertion of students in class.
*/
trigger MaxLimitStudentInsertValidation on Student__c (before insert) {
    Set<Id> classIds= new Set<Id>();
    for(Student__c student: Trigger.new) {
        classIds.add(student.Class__c);
    }
    
    List<Class__c> classes=[Select Id,NumberOfStudents__c,MaxSize__c from Class__c where id IN : classIds];
    
    System.debug(classes);
    for(student__c stdudent : trigger.new){
        for(Class__c classObj: classes){
            if(classObj.Id == stdudent.class__c && classObj.NumberOfStudents__c >= classObj.MaxSize__c) {
                stdudent.addError('Cannot insert more student. Class max size limit exceeded.');
            }
        }
    } 
}