public class DeleteStudentController {
    public List <Student__C> studentList{get;set;}
    private Set<id> setOfId =new Set<id>();
    public DeleteStudentController(ApexPages.StandardSetController standardController)
    {
        studentList = new List<Student__C>();
        studentList = (List<student__c>)standardController.getSelected();
        for(student__C student : (List<student__c>)standardController.getSelected())
        {
            setOfId.add(student.id);
        }
        studentList = [select id ,name,class__r.name from Student__C where id IN:setOfId];
    }
    /*
     * Description: This function invokes when user click on 'Cancel' button.It will do nothing and return back to listView.
     */ 
    
    public PageReference  getReferer(){
        return new ApexPages.Action('{!List}').invoke();
    }
    /*
     * Description: This function invokes when user click on 'continue' button.
     * It will delete records and return back to list view.
     */ 
    
    public PageReference deleteStudents(){
        if(studentList != null)
        {
            delete studentList;
        }
        else
        {
          ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please Select atleast on student!!!!!!!!!!'));  
        }
        return new ApexPages.Action('{!List}').invoke();
    }
    
}