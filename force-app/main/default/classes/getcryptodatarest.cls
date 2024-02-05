public class getcryptodatarest 
{
    public static double call1(string pacur,string pacoin)
    {
		http hp = new http();
        httpresponse res = new httpresponse();
        httprequest req = new httprequest();
        string g = pacur;
       string cc = pacoin;
        string cur='http://api.coinlayer.com/live?access_key=c6c5ebdc5dee5ed86e15a6b73dd1e0e8&target='+g;
        req.setEndpoint(cur);
        req.setmethod('GET');
        //req.setHeader('access_key', 'c6c5ebdc5dee5ed86e15a6b73dd1e0e8');
        
        
        res = hp.send(req);
        map<string,object> map11 = (map<string,object>)json.deserializeuntyped(res.getBody());
        //system.debug(map11);
        map<string,object> map22 = (map<string,object>)map11.get('rates');
        //system.debug(map22);
        double inrvalue = (decimal)map22.get(cc);
        system.debug(inrvalue);
        return inrvalue;
        
    }
}