public class StudentSiteController {
    
    public List<Student__c> stdList{set ;get ;} 
    public Student__c student{set ;get ;}
    public String selectedValue{set ;get ;}
    public boolean showDetail{set ;get ;}
    public ApexPages.StandardController controller;
    
    public StudentSiteController(ApexPages.StandardController con) {
        showDetail = false;
        student = new Student__c();
    }
    
	// Method Providing Student list
    public List<SelectOption> getselectList() {
        List<SelectOption> selectList = new List<SelectOption>();
        stdList = [select Name from Student__c];
        for(Student__c std : stdList) {
            selectList.add(new SelectOption(std.Id,std.Name));
        }
        return selectList;
    }
    
	//Method Providing Student Information
    public PageReference getStudent() {
        try{
            showDetail = true;
            student = [select Id,Name,lastName__c,Class__c,DOB__c from Student__c where id =:selectedValue limit 1] ;
            return null ;
        }
        catch(Exception e){
            return new PageReference('/apex/errorfinder');
        }
    }
}