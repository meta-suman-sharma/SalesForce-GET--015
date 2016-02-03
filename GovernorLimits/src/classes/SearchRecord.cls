public class SearchRecord {
    public List<Account> records{get;set;}
    public void SearchRecord(){
        records=new list<Account>(); 
        string Query = 'SELECT id,name FROM Account Limit 10';
        records=Database.query(Query);
        system.debug(limits.getQueries());
        Integer consumed;
        consumed=((limits.getQueries()*100)/limits.getLimitQueries());
        system.debug(consumed+'% of DMLs were being consumed out of '+limits.getLimitQueries());
    }
}