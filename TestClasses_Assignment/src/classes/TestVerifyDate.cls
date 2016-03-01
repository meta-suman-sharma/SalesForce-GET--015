@isTest
public class TestVerifyDate {
    @isTest static void testDate(){
      Date date1 = Date.newInstance(2016, 2, 12);
	  Date date2 = Date.newInstance(2016, 2, 14);
      Date date3 = VerifyDate.CheckDates(date1, date2);
      System.assertEquals(date2, date3);
    }
    
    @isTest static void testDate2(){
      Date date1 = Date.newInstance(2016, 3, 12);
	  Date date2 = Date.newInstance(2016, 1, 14);
      Date expected  =Date.newInstance(2016, 3, 31);
      Date date3 = VerifyDate.CheckDates(date1, date2);
      System.assertEquals(expected, date3);
    }
    
     @isTest static void testDate3(){
      Date date1 = Date.newInstance(2016, 1, 12);
	  Date date2 = Date.newInstance(2016, 3, 14);
      Date expected  =Date.newInstance(2016, 1, 31);
      Date date3 = VerifyDate.CheckDates(date1, date2);
      System.assertEquals(expected, date3);
    }
}