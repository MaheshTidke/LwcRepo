public with sharing class  meta {
    
    public static void updateFieldPermissions(List<FieldPermissions> fieldPermissions) {
        
            MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.timeout_x = 60000;
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
            
            //service.updateMetadata(new MetadataService.SaveResult[] { service.createMetadata(fieldPermissions)});
        /*List<MetadataService.PermissionSetFieldPermissions> fldPermissions = new List<MetadataService.PermissionSetFieldPermissions>();
        MetadataService.PermissionSetFieldPermissions fldPrmsn = new MetadataService.PermissionSetFieldPermissions();
                //fldPrmsn.field = selectedField.getName();
                fldPrmsn.field = 'Account.Type';
                fldPrmsn.readable = true;
                fldPrmsn.editable = false;
                fldPermissions.add(fldPrmsn);*/
    }
    
}