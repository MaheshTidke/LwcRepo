public class dml3q 
{

    public static void we()
    {
        List<Opportunity> opp = new List<Opportunity>();
    	
    Map<ID, Account> accountmapq = new Map<ID, Account>
        ([Select Id,name,(Select Id From Opportunities) From Account]);
        
        for(account b :accountmapq.values())
        {
            //system.debug(b.name);
            if(b.opportunities.size()==2)
            {
                
               opp.add(new Opportunity(AccountId = b.Id, Name ='Your Opportunity', StageName ='prospecting',CloseDate =System.today()));
                
                   
            }
            if(opp.size()>0)
            {
                upsert opp;
            }
        }

	}
}