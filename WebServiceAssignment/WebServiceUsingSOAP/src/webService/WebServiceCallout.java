package webService;

import java.net.URL;
import com.sforce.soap.enterprise.LoginResult;
import com.sforce.soap.enterprise.SessionHeader;
import com.sforce.soap.enterprise.SforceServiceLocator;
import com.sforce.soap.enterprise.SoapBindingStub;
import com.sforce.soap.schemas._class.JavaToSalesforceWebServiceExample.JavaToSalesforceWebServiceExampleBindingStub;
import com.sforce.soap.schemas._class.JavaToSalesforceWebServiceExample.JavaToSalesforceWebServiceExampleServiceLocator;

/**
 * @author Suman Sharma
 *
 */
public class WebServiceCallout {
	public static void main(String[] args) {
		System.out.println("start of program");
		try { // Get a stub for calling enterprise WSDL's login method in order
				// to get SessionID
			SoapBindingStub bind = (SoapBindingStub) new SforceServiceLocator()
					.getSoap();
			LoginResult lr = bind.login("nidhi.sharma@salesforce.com",
					"nidhi8502911608sharma");

			// Create a sessionHeader object and set its sessionId property to
			// sessionId
			// received in loginResult object
			SessionHeader sh = new SessionHeader();
			sh.setSessionId(lr.getSessionId());

			// Create a service locator object for your custom web service
			JavaToSalesforceWebServiceExampleServiceLocator locator = new JavaToSalesforceWebServiceExampleServiceLocator();

			// Get URL for your custom web service
			URL url = new URL(locator.getJavaToSalesforceWebServiceExampleAddress());

			// Create a stub for your custom web service with URL for your
			// service and locator as parameters
			JavaToSalesforceWebServiceExampleBindingStub stub = new JavaToSalesforceWebServiceExampleBindingStub(
					url, locator);

			// Set the header property of stub with name "SessionHeader" and
			// value as sh-sessionHeader
			// object created above
			stub.setHeader(locator.getJavaToSalesforceWebServiceExampleAddress(),
					"SessionHeader", sh);

			// now make call to custom service-in our case its
			// "Hello(String name)"
			System.out
					.println(stub.retrieveContacts("Select Name From Contact"));
			System.out.println(stub.insertStudent("Ram","Jain","a0J28000002aacO"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}