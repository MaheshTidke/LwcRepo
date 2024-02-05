public class updatefield {
    
    public static void updateFieldReadAccess(String settingsData) {
        
        Map<String, Object> data = (Map<String, Object>) JSON.deserializeUntyped(settingsData);
        
        
        
        // Update field permissions
        
        FieldPermissions fieldPermission = new FieldPermissions();
        
        fieldPermission.Parent.profile.id = '00e5j000000uRlIAAU';
        
        fieldPermission.Field = 'Account.Type';
        
        fieldPermission.SobjectType='Account';
        
        fieldPermission.PermissionsRead=true;
        
        
        
        try {
            
           meta.updateFieldPermissions(new List<FieldPermissions> { fieldPermission });
            
        } catch (DmlException e) {
            
            System.debug('Error updating field permissions: ' + e.getMessage());
        }
        
    }
}