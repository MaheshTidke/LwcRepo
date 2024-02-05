public class deml88 
{
	public static void u()
    {
       List<Opportunity> opp = new List<Opportunity>();
    
    Map<ID, Account> accountmap = new Map<ID, Account>
        ([Select Id,name,(Select Id From Opportunities) From Account]);
        
        for(account b :accountmap.values())
        {
            //system.debug(b.name);
            if(b.opportunities.size()>2)
            {
                //system.debug(b+' &&&' +(b.opportunities));
                //delete opp;
               delete b.opportunities;
            }
            
        }

    }
}