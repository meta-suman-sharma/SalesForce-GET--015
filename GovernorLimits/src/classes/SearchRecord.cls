public class SearchRecord {
    public List<Account> records{get;set;}
    public void SearchRecord(){
        records=new list<Account>(); 
        //Query for searching 10 records from account
        string Query = 'SELECT id,name FROM Account Limit 10';
        //Get records from database
        records=Database.query(Query);
        //Get Maximum limit of Quiries can run in single Execution
        system.debug(limits.getQueries());
        //Calculate percentage consumed in single execution limit
        Integer consumed=((limits.getQueries()*100)/limits.getLimitQueries());
        system.debug(consumed+'% of DMLs were being consumed out of '+limits.getLimitQueries());
    }
}
