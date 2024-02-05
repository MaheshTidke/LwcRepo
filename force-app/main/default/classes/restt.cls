public class restt 
{
    public static void call()
    {
		http hp = new http();
        httpresponse res = new httpresponse();
        httprequest req = new httprequest();
        
        req.setEndpoint('https://api.apilayer.com/exchangerates_data/latest');
        req.setmethod('GET');
        req.setHeader('APIKEY', '4pmdA1VpkQ1gkGVWZnaUB8rAESFV9i2z');
        
        
        res = hp.send(req);
        
        map<string,object> map1 = (map<string,object>)json.deserializeuntyped(res.getBody());
		
        system.debug(map1);
        /*
         {base=EUR, date=2022-11-28, 
            rates={AED=3.800949, AFN=92.702301, ALL=116.805157, AMD=410.948144, 
            ANG=1.872665, AOA=529.693234, ARS=171.45457, AUD=1.549574, AWG=1.86265, AZN=1.758851, ...}, 
            success=true, timestamp=1669614902}
			*/
        map<string,object> map2 = (map<string,object>)map1.get('rates');
        decimal useusd = (decimal)map2.get('INR');
        decimal f= 456;
        decimal ratess = useusd * f;
        system.debug(ratess);
        
    }

}