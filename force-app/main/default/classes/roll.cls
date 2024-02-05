public class roll 
{
    public static void r()
    {
        
        list<account> acl = new list<account>();
        list<contact> ccl = new list<contact>();
        for(integer i =0;i<100;i++)
        {
          Account a = new Account (Name = 'amanda3');
            acl.add(a);
        }
        Savepoint sp = Database.setSavepoint();
    try{
    	insert acl;
        
        integer j=0;
    	for(account ab :acl)
        {j++;
           Contact c = new Contact (AccountId = ab.Id);
           ccl.add(c);
           //system.debug('in else less than 80++++++++++++++++++++) ||'+c);
             if(j>80)
            {
                ab.Name = 'am';
                
                ccl.add(c);
               //system.debug('in if equal to 80 ||'+c);
                //break;
            }
            
        }
    
        upsert ccl;
		
        
    }
    catch(Exception e){
        
    Database.rollback(sp);
        system.debug('rollbacked');
    }
    //acl.Name = 'amanda1';
    
    }

}