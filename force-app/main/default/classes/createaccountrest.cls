@RESTresource(urlMapping='/createacc/*')
global class createaccountrest 
{
    @HTTPpost
    global static list<account> createacc()
    {
         string fname;
        restrequest reqv = restcontext.request;
        restresponse respv = restcontext.response;
        string jsaonbody = reqv.requestBody.tostring();
        jsonparser	par = json.createParser(jsaonbody);
        while(par.nextToken() != null)
        {
			if(par.getCurrentToken() != jsontoken.END_OBJECT)
            {
                string fieldname	= par.getCurrentName();
                string fieldvalue 	= par.getText();
                if(fieldname == 'name')
                {
                    fname = fieldvalue;
                }
            }
        }
        account n = new account(name = fname);
        list<account> aclis =  new list<account>();
        aclis=[select id,name from account where name =:fname];
       // insert n;
        return aclis;
    }
	@HTTPget
    global static list<account> getacc()
    {
         string fname;
        restrequest reqv = restcontext.request;
        restresponse respv = restcontext.response;
        string jsaonbody = reqv.requestBody.tostring();
        jsonparser	par = json.createParser(jsaonbody);
        while(par.nextToken() != null)
        {
			if(par.getCurrentToken() != jsontoken.END_OBJECT)
            {
                string fieldname	= par.getCurrentName();
                string fieldvalue 	= par.getText();
                if(fieldname == 'name')
                {
                    fname = fieldvalue;
                }
            }
        }
        account n = new account(name = fname);
        list<account> aclis =  new list<account>();
        aclis=[select id,name from account where name =:fname];
       // insert n;
        return aclis;
    }
}