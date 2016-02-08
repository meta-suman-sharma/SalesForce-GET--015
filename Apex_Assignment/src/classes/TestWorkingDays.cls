@isTest
public class TestWorkingDays {
	@isTest static void testgetWorkingDaysMethod(){
         Integer expected=11;
             
         Integer actual=WorkingDays.getWorkingDays(DateTime.newInstance(2016, 1,1, 0, 0, 0),DateTime.newInstance(2016, 1,17, 0, 0, 0));
        System.assertEquals(expected, actual);
       }
}