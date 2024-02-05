public class dml10 
{
    public static void back()
    {
        /*==
        Account a = new Account (Name = 'Test03082013');
        Savepoint sp = Database.setSavepoint();
        try{
        insert a;
        Contact c = new Contact (AccountId = a.Id);
        insert c;
        }
        catch(Exception e){
        Database.rollback(sp);
        }
        a.Name = 'Test2';
        ==*/
        savepoint sp1 =  database.setSavepoint();
        try
        {
            list<account> acclist = new list<account>();
            for(integer i =0;i<100;i++)
            {
                
                account acc = new account(name = 'roll back testing'+i);
                acclist.add(acc);
				
				if(i==81)
                {
                    break;
                }
                
            }
            if(acclist.size()>80){insert acclist;}
            
        }
        catch(exception e)
        {
            system.debug('exception occured and transcation got rolled back');
            database.rollback(sp1);
        }
    }

}