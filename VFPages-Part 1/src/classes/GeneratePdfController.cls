public with sharing class GeneratePdfController {
    public List<Student__c> studentList{get;set;}
    public GeneratePdfController (){
        studentList = [select id,name,Class__c,DOB__c,Sex__c from Student__c limit 10];
    }
}