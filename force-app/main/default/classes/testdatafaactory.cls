public class testdatafaactory 
{
    
    public static void makingaccountcontactdata()
    {
        list<account> acl = new list<account>();
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
        insert ccl;
        
    }
    
    public static list<account> returnaccouncon()
    {
        list<account> aclist = [select id,name,amount__c,(select id,lastname,amountofcon__c from contacts) 
                                from account where name='testthis'];
        return aclist;
        
    }
    
    
}