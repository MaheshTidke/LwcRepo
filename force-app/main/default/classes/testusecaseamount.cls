@istest
public class testusecaseamount 
{
    @testsetup
    public static void makedata()
    {
		testdatafaactory.makingaccountcontactdata();        
        /*list<account> acl = new list<account>();
        for(integer i = 0;i < 1 ; i++)
        {
            account n = new account(name='testthis',amount__c=100);
            acl.add(n);
        }
        insert acl;
        list<contact> ccl = new list<contact>();
        for(account ac :acl)
        {
            for(integer k = 0;k<4;k++)
            {
                contact v = new contact(lastname='contacttest'+k,amountofcon__c=0,accountid=ac.id);
                ccl.add(v);  
            }
        }
        insert ccl;*/
    }
    
    @istest
    public static void testdata()
    {
        test.startTest();
        list<account> aclist = [select id,name,amount__c,(select id,lastname,amountofcon__c from contacts) 
                                from account where name='testthis'];
        
        aclist[0].amount__c=200;
        update aclist;
        //usecaseamounthelper.helpp(aclist);
        system.debug(aclist[0].name);
        system.debug(aclist[0].amount__c);
        
        list<account> aclist1 = [select id,name,amount__c,(select id,name,amountofcon__c from contacts) 
                                 from account where name='testthis'];
        for(account aa : aclist1)
        {system.assertEquals(200,aa.amount__c);
         for(contact ccc: aa.contacts)
         {
             system.debug(ccc.amountofcon__c);
             system.assertEquals(50, ccc.amountofcon__c);
         }
        }
       test.stopTest();
    }
     @istest
    public static void testddata()
    {
        test.startTest();
        list<account> aclist = [select id,name,amount__c,(select id,lastname,amountofcon__c from contacts) 
                                from account where name='testthis'];
        
        aclist[0].amount__c=209;
        update aclist;
        //usecaseamounthelper.helpp(aclist);
        system.debug(aclist[0].name);
        system.debug(aclist[0].amount__c);
        
        list<account> aclist1 = [select id,name,amount__c,(select id,name,amountofcon__c from contacts) 
                                 from account where name='testthis'];
        for(account aa : aclist1)
        {system.assertEquals(209,aa.amount__c);
         for(contact ccc: aa.contacts)
         {
             system.debug(ccc.amountofcon__c);
             system.assertEquals(52.25, ccc.amountofcon__c);
         }
        }
       test.stopTest();
    }
}