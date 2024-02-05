public class usecase1helper 
{
    public static void helpinsert(list<account> acl)
    {
        //list<account> acl = trigger.new;
        set<id> setid =  new set<id>();
        for(account ac : acl)
        {
            setid.add(ac.id);
        }
        list<account> acl1 = new list<account>();
        acl1 = [select id,name,(select id, name from opportunities) from account where id in :setid];
        
        list<opportunity> opp = new list<opportunity>();
        if(!acl1.isEmpty())
        {
            for(account a  :acl1)
            {
                if(a.opportunities.size()==0)
                {
                    opp.add(new Opportunity(AccountId = a.Id,
                                            Name =a.name+'First Opportunity', 
                                            StageName ='prospecting',
                                            CloseDate =System.today()));
                }
                if(opp.size()>0)
                {
                    insert opp;
                }  
            }
        }
    }
    public static void helpupdate(list<account> acl)
    {
        //list<account> acl = trigger.new;
        set<id> setid =  new set<id>();
        for(account ac : acl)
        {
            setid.add(ac.id);
        }
        list<account> acl1 = new list<account>();
        acl1 = [select id,name,(select id, name from opportunities) from account where id in :setid];
        
        list<opportunity> opp = new list<opportunity>();
        if(!acl1.isEmpty())
        {
            for(account a  :acl1)
            {
                if(a.opportunities.size()==0)
                {
                    opp.add(new Opportunity(AccountId = a.Id,
                                            Name =a.name+'First Opportunity', 
                                            StageName ='prospecting',
                                            CloseDate =System.today()));
                }
                if(opp.size()>0)
                {
                    insert opp;
                }  
            }
        }
    }
}