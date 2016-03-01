@isTest
public class SearchRecordTest {    
	@isTest
    static void testSearchRecord() {
        List<Account> testRecords=new List<Account>();
        testRecords = [SELECT id,name FROM Account Limit 10];
        SearchRecord searchRecord=new SearchRecord();
        System.assertEquals(testRecords, searchRecord.SearchRecord());
    }
}