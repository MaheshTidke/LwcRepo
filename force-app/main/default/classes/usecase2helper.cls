public class usecase2helper 
{
    public static void help1(List<Opportunity> oppListo)
    {
        Set<Id> acid = new set<id>();
        for(opportunity n : oppListo)
        {
            acid.add(n.AccountId);
        }

       
        list<opportunity> acl = new list<opportunity>();
        list<account> qa = new list<account>();	
		//acl = [select id,name,account.name,account.id from opportunity where id in :opid];        
        
		set<string> opname = new set<string>();        											
        
        
        qa = [select id,name,(select id,name from opportunities) from account where id in :acid];
        for(account la :qa)
        {
            for(opportunity u : la.opportunities)
            {
                opname.add(u.name);
            }
        }
        for(opportunity na : oppListo)
        {
            if(opname.contains(na.name)==true)
            {
                na.name = na.name + ' duplicate name';
            }
        }  
    }
}