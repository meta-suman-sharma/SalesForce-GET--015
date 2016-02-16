/*
* Trigger will check before delete if the class has more than one female students then not allow to delete that class 
*/
trigger FemaleStudentclassTrigger on Class__c (before delete) {
    List<Student__c> studentList = [Select id,class__r.id from Student__c where Sex__c='Female' AND Class__c In :Trigger.old];
    for(Class__c classObj: Trigger.old) {
        Integer NoOfFemaleStudents=0;
        for(Student__C student : studentList){
            if(classObj.id == student.class__r.id){
                if(++NoOfFemaleStudents > 1){
                    Trigger.oldMap.get(classObj.id).adderror('Cannot delete a Class having more than 1 female student');
                    break;
                }
            }
        }
    }
}