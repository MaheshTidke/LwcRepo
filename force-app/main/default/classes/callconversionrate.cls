public class callconversionrate 
{
    public static void callmethod()
    {
        
        http hp = new http();
        httprequest req = new httprequest();
        httpresponse resp = new httpresponse();
        
        req.setMethod('GET');
        req.setEndpoint('https://api.exchangeratesapi.io/v1/convert?access_key=4pmdA1VpkQ1gkGVWZnaUB8rAESFV9i2z');
        
        resp = hp.send(req);
        
        map<string,object> mapmaster = (map<string,object>) json.deserializeuntyped(resp.getBody());
        system.debug(mapmaster);
        if(resp.getstatusCode() == 200 && resp.getbody() != null)
        {
            system.debug('Response: '+ resp.getBody());
            
        }
    }
    
}