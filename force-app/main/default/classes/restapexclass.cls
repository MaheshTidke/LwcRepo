@restresource(urlmapping = '/getrecord/')
global class restapexclass 
{
    @httppost
    global static void sendrec()
    {
        string name;
        string idof;
        string objectn;
        string query;
		restrequest req = restcontext.request;
        restresponse resp = restcontext.response;
        idof = req.headers.get('idofrec');
		objectn = req.headers.get('objectname'); 
         fromJSON jsonBody ;
        try
        {
            jsonBody  = (fromJSON) JSON.deserialize(req.requestBody.toString(),fromJSON.class);
        }
        Catch(Exception ee)
        {
        }
		query = 'select id,name from '+ jsonBody.Parm1 +' where id = '+jsonBody.Parm2 + ' limit 1';
                system.debug(query);
               list<sobject> s =  database.Query(query);
                for(sobject ss: s)
                {
                    system.debug(ss);
                }
        
    }
    
    public class fromJSON
    {
        public String Parm1;    //Value1
        public String Parm2;    //Value2
    }
        
       /* string jsonbody = req.requestBody.tostring();
        
        jsonparser parser = json.createparser(jsonbody);
        while(parser.nextToken() != null)
        {
            if(parser.getCurrentToken() != jsontoken.END_OBJECT)
            {
                string fieldname = parser.getCurrentName();
                string fieldvalue = parser.gettext();
                if(fieldname == 'objectname' )
                {
				 objectn = fieldvalue ;
                   
                }
                else if(fieldname == 'idofrec')
                {
				idof = fieldvalue; 
                }
            }
            system.debug(idof);
             query = 'select id,name from '+ objectn +' where id = :idof' + ' limit 1';
                system.debug(query);
               list<sobject> s =  database.Query(query);
                for(sobject ss: s)
                {
                    system.debug(ss);
                }
        }*/
}