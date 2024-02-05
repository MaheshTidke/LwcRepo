@istest
public class testappendgender 
{
    @testsetup
    public static void testgender()
    {
        list<Accounto__c> nm = new list<Accounto__c>();
        
        Accounto__c gh = new Accounto__c(name='dummy',account_type__c='Saving',Balance__c=90000,Account__c='a075j000004NAzNAAW',Gender__c='Male');
        Accounto__c ghq = new Accounto__c(name='dummyq',account_type__c='Saving',Balance__c=90000,Account__c='a075j000004NAzNAAW',Gender__c='Female');
        nm.add(gh);
        nm.add(ghq);
         insert nm;
    }
    @istest
    public static void tess()
    {
       list<Accounto__c> nma = new list<Accounto__c>();
        nma = [select name,Gender__c from Accounto__c];
        system.assertEquals('MR. dummy',nma[0].name);
        system.assertEquals('MRs. dummyq',nma[1].name);
        system.assertNotEquals('MR. dummy',nma[1].name);
        system.debug(nma);
        
    }

}