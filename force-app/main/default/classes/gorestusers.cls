public class gorestusers {
	public static list<object> call1()
    {
		http hp = new http();
        httpresponse res = new httpresponse();
        httprequest req = new httprequest();
       
        string cur='https://gorest.co.in/public/v2/users';
        req.setEndpoint(cur);
        req.setmethod('GET');
        //req.setHeader('access_key', 'c6c5ebdc5dee5ed86e15a6b73dd1e0e8');
        
        
        res = hp.send(req);
        //map<string,object> map11 = (map<string,object>)json.deserializeuntyped(res.getBody());
        //system.debug(map11);
        list<object> k = (list<object>)json.deserializeuntyped(res.getBody());
        system.debug(k);
        //system.debug(json.deserializeuntyped(res.getBody()));
        return k;
        /*map<string,object> map22 = (map<string,object>)map11.get('rates');
        //system.debug(map22);
        double inrvalue = (decimal)map22.get(cc);
        system.debug(inrvalue);
        return inrvalue;*/
        
    }
}