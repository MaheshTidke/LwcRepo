public class usecaseamounthelper 
{
    public static void helpp(list<account> alist)
    {
        set<id> aid = new set<id>();
        for(account ac :alist)
        {
            aid.add(ac.id);
        }
        list<account> aclist = new list<account>();
        list<contact> clist = new list<contact>();
        aclist = [select id,name,amount__c,(select id,amountofcon__c from contacts) from account where id in :aid];
        integer i =0;
        integer sum = 0;
        decimal div = 0;
        if(!aclist.isempty())
        {
            for(account acc :aclist)
            {
                i = acc.contacts.size();
                div = acc.amount__c/i;
                //system.debug(div);
                for(contact c :acc.contacts)
                { 
                    c.amountofcon__c = div; 
                    //system.debug(c.amountofcon__c);
                    clist.add(c);
                }
            }
            update clist;
        }
        
    }
}