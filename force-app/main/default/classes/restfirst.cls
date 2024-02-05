@RESTResource(urlmapping='/createlead/')
global class restfirst 
{
    @HTTPPost
    global static list<lead> creatingleadrecord()
    {
        string fieldvalue,fieldname,fname,lname,comp;
        restrequest req = restcontext.request;
        
        restresponse res = restcontext.response;
        
        string arr = req.requestBody.tostring();
        
        Jsonparser parse = json.createParser(arr);
        
        while(parse.nextToken()!=null)
        {
            if(parse.getcurrenttoken() != jsontoken.end_object)
            {
                fieldname = parse.getCurrentName();
                fieldvalue = parse.gettext();
                
                if(fieldname == 'firstname')
                {
                    fname = fieldvalue;
                }
                else if(fieldname == 'lastname')
                {
                    lname = fieldvalue;
                }
                else if(fieldname == 'company')
                {
                    comp = fieldvalue;
                }
            }
        }
        list<lead> v = new list<lead>();
        lead l = new lead(firstname = fname,lastname = lname,company=comp);
        v.add(l);
        insert v;
        return v;
    }
}