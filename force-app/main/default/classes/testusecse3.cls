@istest
public class testusecse3 
{
    @testsetup
    public static void makedata()
    {
        account a = new account(name = 'tesla',phone='123456',website = 'a.com');
        insert a;
    }
	@istest
	public static void test()
    {
        list<account> b = [select id,name from account];
        delete b;
        list<accountbackup__c> nm = [select id,name,website_from_acc__c,account_phone_backup__c 
                                     from accountbackup__c where name = 'tesla'];
        assert.areEqual('tesla',nm[0].name);
        system.Assertequals('a.com',nm[0].website_from_acc__c);
        system.Assertequals('123456',nm[0].account_phone_backup__c,'pass');
    }
    @istest
	public static void testa()
    {
        test.startTest();
        list<account> bq = [select id,name from account];
        delete bq;
        list<accountbackup__c> nmq = [select id,name,website_from_acc__c,account_phone_backup__c 
                                     from accountbackup__c where name = 'tesla'];
        assert.areNotEqual('tesl',nmq[0].name);
        //system.Assertequals('a.com',nmq[0].website_from_acc__c);
        //system.Assertequals('123456',nmq[0].account_phone_backup__c,'pass');
        test.stopTest();
    }
}