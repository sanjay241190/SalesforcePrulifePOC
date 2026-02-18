public class JSONParserUtil {
//@future(callout=true)
    public static void parseJSONResponse() {        
        Http httpProtocol = new Http();
        // Create HTTP request to send.
        HttpRequest request = new HttpRequest();
        // Set the endpoint URL.
        String endpoint = 'http://dummy.restapiexample.com/api/v1/employees';
        request.setEndPoint(endpoint);
        request.setTimeout(40000);
        // Set the HTTP verb to GET.
        request.setMethod('GET');
        // Send the HTTP request and get the response.
        // The response is in JSON format.
        HttpResponse response = httpProtocol.send(request);
        System.debug(response.getBody());
       
        List<Account> lstAcc=new List<Account>();
        String res=response.getBody();
        String fname = null;
        String exId= null;
        JSONWrapper.result n = (JSONWrapper.result)JSON.deserialize(res, JSONWrapper.result.class);
        System.debug(n);
        For(JSONWrapper.data objData: n.data)
        {
          		Account objAcc=new Account();
                objAcc.Name=objData.employee_name+'1';
                objAcc.External_Id__c=String.valueof(objData.Id);
                lstAcc.add(objAcc);  
        }
        
        if(!lstAcc.isEmpty())
        {
          upsert lstAcc;
            
        }
    }   
}