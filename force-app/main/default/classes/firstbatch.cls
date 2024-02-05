global class firstbatch implements database.Batchable<Sobject> 
{
    global database.QueryLocator start(database.Batchablecontext bc)
    {
        
        return database.getQueryLocator([select name from account where name like 'batch%']);
    }
    
    global void execute(database.Batchablecontext bc,list<account> acl)
    {
        for(account a : acl)
        {
            a.name = a.name + ' edited two';	
        }
        system.debug(acl.size());
        update acl;
    }
    
    global void finish(database.BatchableContext bc)
    {
        system.debug('executed succesfully');
    }
    
}