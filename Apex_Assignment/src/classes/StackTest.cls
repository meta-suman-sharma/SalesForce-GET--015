@isTest 
public class StackTest {
    @isTest static void testStackIsEmptyMethod(){
        Boolean expected=true;
        Stack stack=new Stack();
        Boolean actual=Stack.isEmpty();
        system.assertEquals(expected, actual);
       }
    @isTest static void testStackSizeMethod(){
        Integer expected=0;
        Stack stack=new Stack();
        Integer actual=Stack.size();
        system.assertEquals(expected, actual);
       }
    
 	@isTest static void testStackPushMethod(){
        List<Object> expected=new List<Object>{1,2,3};
        Stack stack=new Stack();
        stack.push(1);
        stack.push(2);
        stack.push(3);
        List<Object> actual=Stack.printStack();
        system.assertEquals(expected, actual);
       }
    @isTest static void testStackPopMethod(){
        List<Object> expected=new List<Object>{1};
        Stack stack=new Stack();
        stack.push(1);
        stack.push(2);
        stack.push(3);
        stack.pop();
        stack.pop();
        List<Object> actual=Stack.printStack();
        system.assertEquals(expected, actual);
       }
     @isTest static void testStackPopExceptionMethod(){
        Stack stack=new Stack();
        Test.startTest();
        stack.pop();
        Test.stopTest();
         System.Assert(True);
       }
}