global class batchpractise implements database.Batchable<sobject>
{
    //commenting this line for demo purpose.
    // adding another sencond line for demo purpose.
    list<opportunity> lp = new list<opportunity>();
    public database.querylocator start(database.BatchableContext bc)
    {
        return database.getQueryLocator([select id, name from opportunity limit 1]);
    }
    public void execute(database.BatchableContext bc,list<opportunity> opl)
    {
       list<opportunity> lal = new list<opportunity>();
        
        for(integer i =0;i<10001;i++)
        {
            opportunity y = new opportunity(name = 'batch '+i,	CloseDate= system.today(),StageName='Perception Analysis');
			lal.add(y);
		}
        insert lal;
        
    }
    public void finish(database.BatchableContext bc)
    {
     asyncapexjob ids = [ select id,status from asyncapexjob where id = :bc.getJobId()];
	system.debug('status :'+ ids.status);
    }
	    
}