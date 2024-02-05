public class ContactController 
{
    @AuraEnabled(cacheable=true)
    public static list<Contact> getContacts()
    {
        //  return [
        //     SELECT FirstName, LastName, Email
        //     FROM Contact
        //     WITH SECURITY_ENFORCED
        //     ORDER BY Name
        // ];
        throw new AuraHandledException('Forced error');
    }

}