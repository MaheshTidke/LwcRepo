public class vb {
    public static void gh(){
        list<FieldPermissions> kll = new list<FieldPermissions>();
        list<FieldPermissions> up = new list<FieldPermissions>();
        
        kll=[SELECT  Field, PermissionsEdit, PermissionsRead FROM 
             FieldPermissions where SobjectType='account' and field='Account.Type' ];
        
        set<string> setstr = new set<string>();
        for(integer i=0;i<60;i++)
        {
            FieldPermissions d = new FieldPermissions();
            d.PermissionsRead = true;
            up.add(d);
        }
        update up;
        
        system.debug(setstr);
        system.debug(setstr.size());
        
    }
}