/*
* Trigger will update field value MyCount__c after insert,update and delete
* trigger will increase MyCount__c by one whenever a student is inserted in class and
* trigger will Decrease MyCount__c by one whenever a student is Deleted from class.
*/
trigger UpdateMyCountOnStudent on Student__c (after insert,after update,after Delete) {
    if(Trigger.isInsert || Trigger.isUpdate) {
        for(Student__c student : Trigger.new) {
            Class__c classObject = [Select id, name, MyCount__c,NumberOfStudents__c from Class__c where id =: student.Class__c];
            
            if(classObject.MyCount__c==null) {
                classObject.MyCount__c = classObject.NumberOfStudents__c;
            }else if(Trigger.isInsert){
                classObject.MyCount__c++;
            }
            Update classObject;
        }
    }
    if(Trigger.isDelete) {
        for(Student__c student : Trigger.old) {
            Class__c classObject = [Select id, name, MyCount__c,NumberOfStudents__c from Class__c where id =: student.Class__c];
            classObject.MyCount__c--;
            Update classObject;
        }
    }
}