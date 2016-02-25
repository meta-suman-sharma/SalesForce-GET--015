public class FilterAccountWithPaginationController {
    /* billingCity of account */     
    public string getBillingCitystring{get;set;}
    /* BillingState of account */     
    public string getBillingStatestring{get;set;}
    /* BillingCountry of account */     
    public string getBillingCountrystring{get;set;}
    /* to get all accounts */   
    //public List<Account> createAccountList{get;set;}
    
    Public Integer noOfRecords{get; set;}
    Public Integer size{get;set;}
    public ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                size = 10;
                //string queryString = 'Select Name, Type, BillingCity, BillingState, BillingCountry from Account order by Name';
                //createAccountList= new list<Account>();
                string Query = 'SELECT id,name,billingcity,billingCountry,billingState FROM Account where ';
                if(string.isBlank(getBillingCitystring)  && string.isBlank(getBillingStatestring) && string.isBlank(getBillingCountrystring)) 
                {
                    Query = 'SELECT id,name,billingcity,billingCountry,billingState FROM Account';
                }    
                if(!(string.isBlank(getBillingCitystring)))
                {
                    Query = Query + 'billingcity LIKE \'%'+getBillingCitystring+'%\' AND ';
                    
                }
                if(!(string.isBlank(getBillingCountrystring)))
                {
                    Query = Query + ' billingcountry  LIKE  \'%'+getBillingCountrystring+'%\' AND ';
                }
                if(!(string.isBlank(getBillingStatestring)))
                {
                    Query = Query +  ' billingstate LIKE  \'%'+getBillingStatestring+'%\' AND ';
                }
                if(Query.substring(Query.length()-4,Query.length()).equals('AND '))
                {
                    Query= Query.substring(0,Query.length()-4);
                }
                //Query = Query + ' limit 100';
                //createAccountList= Database.query(Query); 
                //
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(Query));
                setCon.setPageSize(size);
                noOfRecords = setCon.getResultSize();
            }
            return setCon;
        }set;
    }
    
    Public List<Account> getAccounts(){
        List<Account> accList = new List<Account>();
        for(Account a : (List<Account>)setCon.getRecords())
            accList.add(a);
        return accList;
    }
    
    public pageReference refresh() {
        setCon = null;
        getAccounts();
        setCon.setPageNumber(1);
        return null;
    }
}