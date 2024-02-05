public class changename 
{
    public static void ch()
    {
        list<account> v = new list<account>();
        list<contact> tra = new list<contact>(); 
        v =[select id,name,(select name from contacts) from account where name like 'Edge Communications'];
        if(!v.isEmpty())
        {
            for(account acc  :v)
            {
                system.debug(acc.id);
                
                for(contact ma  : acc.contacts)
                	{
                        
                    //contact a = new contact(firstname = 'legend_ ',lastname = 'transaction',AccountId=acc.Id);
                   	//tra.add(a);
                    //tra.add(new Transaction__c());
                    system.debug(ma.Name);
                
            		}
            }
            
        }update v;
        insert tra;
    }

}