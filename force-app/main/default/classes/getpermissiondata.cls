public with sharing class getpermissiondata {
    @AuraEnabled(cacheable=true)
    public static list<ObjectPermissions> getpermissioncrud(string[] prname,string objn)
    {
        set<string> prsset =  new set<string>();
        for(string pr: prname)
        {
			prsset.add(pr);            
        }
        list<ObjectPermissions> kl = new list<ObjectPermissions>();
        kl=[SELECT 
        PermissionsCreate, PermissionsRead, PermissionsEdit,parent.profile.name,
        PermissionsDelete, PermissionsViewAllRecords, PermissionsModifyAllRecords 
        FROM ObjectPermissions where parent.profile.name in:prsset and SobjectType=:objn];
        
        /*for(ObjectPermissions prcb: kl)
        {
			system.debug(prcb);           
        }*/
        return kl;
    }
}