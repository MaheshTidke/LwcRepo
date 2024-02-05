public class schemafieldpermis {
    public static void display()
    {
        string profilename = 'customer008';
        string objectname = 'Accounto__c';
      map<string, schema.sobjectfield> fieldmap =  schema.getglobaldescribe().get(objectname).getdescribe().fields.getmap();
        //system.debug(fieldmap);
        for(string fieldname: fieldmap.keyset())
        {
            schema.describefieldresult fielddescribe = fieldmap.get(fieldname).getdescribe();
            system.debug(fielddescribe);
            if(fielddescribe.isaccessible())
            {
                //system.debug(fieldname +' = Read ' +profilename);
            }
            if(fielddescribe.isaccessible() && fielddescribe.isupdateable())
            {
                //system.debug(fieldname +' = Create');
            }
            
            
        }
    }

}