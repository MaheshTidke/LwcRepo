public with sharing class getpermissiondataobj {
    @AuraEnabled(cacheable=true)
    public static list<ObjectPermissions> getpermissioncrudobj(string prname,string[] objset)
    {
        set<string> objsetfind =  new set<string>();
        for(string objj: objset)
        {
			objsetfind.add(objj);            
        }
        list<ObjectPermissions> kl = new list<ObjectPermissions>();
        kl=[SELECT 
        PermissionsCreate, PermissionsRead, PermissionsEdit,parent.profile.name,SobjectType,
        PermissionsDelete, PermissionsViewAllRecords, PermissionsModifyAllRecords 
        FROM ObjectPermissions where parent.profile.name =:prname and SobjectType in :objsetfind];
        
        for(ObjectPermissions prcb: kl)
        {
			 String objectName = prcb.SobjectType;
    // Use the objectName here:
    System.debug('Object Name: ' + objectName);          
        }
        
        system.debug(json.serialize(kl));
        return kl;
    }
}