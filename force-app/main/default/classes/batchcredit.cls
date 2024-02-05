public class batchcredit implements Database.Batchable<sObject>, Database.stateful
{
    public string strqry='';
	public batchcredit(String q)
	{
		strqry=q;
    }
    public database.QueryLocator start(database.BatchableContext context)
    {
        return database.getQueryLocator(strqry);
    }
    public void execute(database.BatchableContext context,list<accounto__c> aclis)
    {
        list<accounto__c> k = new list<accounto__c>();
        for(accounto__c l : aclis)
        {
            
            if(l.credit_score__c==null)
            {l.credit_score__c=0;
			l.credit_score__c = l.credit_score__c + 1; 
            system.debug(l.credit_score__c);
            k.add(l);
            }
            else
            {
              l.credit_score__c = l.credit_score__c + 1; 
            system.debug(l.credit_score__c);
            k.add(l);  
            }
        }
        update k;
    }
    public void finish(database.BatchableContext context)
    {
        system.debug('all records have been processed succesfully');
    }

}