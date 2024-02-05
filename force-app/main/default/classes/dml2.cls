public class dml2 
{
    public static void meth()
    {
        List<Opportunity> opp = new List<Opportunity>();
    
    Map<ID, Account> accountmap = new Map<ID, Account>
        ([Select Id,name,(Select Id From Opportunities) From Account]);
        
        for(account b :accountmap.values())
        {
            //system.debug(b.name);
            if(b.opportunities.size()==0)
            {
                opp.add(new Opportunity(AccountId = b.Id, Name =b.Name+'First Opportunity', StageName ='prospecting',CloseDate =System.today()));
                
            }
            if(opp.size()>0)
            {
                upsert opp;
            }
        }
    }
}