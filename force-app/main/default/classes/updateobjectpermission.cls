public class updateobjectpermission {
    public static void method1()
    {
       list<ObjectPermissions> lst1 = new list<ObjectPermissions>();
        list<ObjectPermissions> updatelst1 = new list<ObjectPermissions>();
       lst1 = [SELECT Id, SobjectType,ParentId, PermissionsCreate, PermissionsRead, PermissionsEdit, PermissionsDelete, PermissionsViewAllRecords, PermissionsModifyAllRecords FROM ObjectPermissions 
              where SobjectType='Account' and parent.profile.name='customer008' ];
        system.debug(lst1);
        for(ObjectPermissions pp : lst1)
        {
            pp.PermissionsModifyAllRecords=false;
            pp.PermissionsViewAllRecords=false;
            updatelst1.add(pp);
        }
        database.update(updatelst1);
        
 	
        
    }
    
}