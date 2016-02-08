public class objectListController {
	 public String name {get;set;}
      public List<SelectOption> getNames()
      {
          List<Schema.SObjectType> obj = Schema.getGlobalDescribe().Values();    
          List<SelectOption> options = new List<SelectOption>();
         
          for(Schema.SObjectType type : obj)
          {
             options.add(new SelectOption(type.getDescribe().getName(),type.getDescribe().getName()));
          }
          return options;
     }
}