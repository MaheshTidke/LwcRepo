public with sharing class getfieldpermissiondata {
    @AuraEnabled(cacheable=true)
    public static list<FieldPermissions> getfieldpermissioncrud(string profnamee,string objectapinn) {
        list<FieldPermissions> kll = new list<FieldPermissions>();
        
        
        kll=[SELECT Id, Field, PermissionsEdit, PermissionsRead,parent.profile.name FROM 
        FieldPermissions where parent.profile.name = :profnamee and SobjectType=:objectapinn];
        return kll;
    }
}