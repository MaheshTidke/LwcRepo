public class totalamountriggerhandler {
    
    public static void afterinsertionandundeletionanddeletion(list<opportunity> oplis,map<id,opportunity> oldoppmap)
    {
        set<id> acid = new set<id>();
        list<account> aclis = new list<account>();
        list<aggregateresult> oplisag = new list<aggregateresult>();
        list<account> aclisins = new list<account>();
        decimal total = 0;
        map<id,decimal> mapopiddec = new map<id,decimal>();
        for(opportunity op: oplis)
        {
            if(oldoppmap != null  && (op.Amount != oldoppmap.get(op.id).amount))
            {
                acid.add(op.accountid);
            }
            else if(oldoppmap==null)
            {
                acid.add(op.accountid);
            }
			
        }
        oplisag = [select sum(amount) Total,AccountId from opportunity where AccountId in : acid group by AccountId];
        
        for(aggregateresult ac: oplisag)
        {
            mapopiddec.put((Id)ac.get('AccountId'),(decimal)ac.get('Total'));
        }
        
        aclis = [select id,name,Total_Opportunity_Amount__c from account where id in:acid];
        
        for(account ac: aclis)
        {
            
                ac.Total_Opportunity_Amount__c = mapopiddec.get(ac.id);
				
            
            aclisins.add(ac);
        }
        update aclisins;
        
    }
    /*public static void afterupdation(list<opportunity> oplis,map<id,opportunity> oldoppmap)
    {
        set<id> acid = new set<id>();
        list<account> aclis = new list<account>();
        list<account> aclisins = new list<account>();
        decimal total = 0;
        for(opportunity op: oplis)
        {
            
               acid.add(op.accountid); 
            
			
        }
        aclis = [select id,name,Total_Opportunity_Amount__c,(select id,name,amount from opportunities) from account where id in:acid];
        for(account ac: aclis)
        {
            for(opportunity ol:ac.opportunities)
            {
                total = ol.Amount + total;
				
            }
            ac.Total_Opportunity_Amount__c = total;
            aclisins.add(ac);
        }
        update aclisins;
        
    }*/
    /*
    public static void afterdeletion(list<opportunity> oplis)
    {
        set<id> acid = new set<id>();
        list<account> aclis = new list<account>();
        list<account> aclisins = new list<account>();
        decimal total = 0;
        for(opportunity op: oplis)
        {
			acid.add(op.accountid);
        }
        aclis = [select id,name,Total_Opportunity_Amount__c,(select id,name,amount from opportunities) from account where id in:acid];
        for(account ac: aclis)
        {
            for(opportunity ol:ac.opportunities)
            {
                total = ol.Amount + total;
				
            }
            ac.Total_Opportunity_Amount__c = total;
            aclisins.add(ac);
        }
        update aclisins;
    }*/

}