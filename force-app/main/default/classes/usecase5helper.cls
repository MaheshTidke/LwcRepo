public class usecase5helper 
{
    public static void helpp(list<opportunity> opl1)
    {
        set<id> acset = new set<id>();
        for(opportunity op :opl1)
        {
            acset.add(op.accountid);
        }
        list<account> acl  = new list<account>();
        acl = [select id,name,rating,CustomerPriority__c,(select id,name,accountid,amount from opportunities) from account where id in :acset];
        for(account ac :acl)
        {
            for(opportunity opp :ac.opportunities)
            {
                if(ac.id==opp.accountid && opp.amount>10000)
                {
                    ac.Rating = 'Hot';
                    ac.CustomerPriority__c='High';
                }
            }
            
        }update acl;
    }
}