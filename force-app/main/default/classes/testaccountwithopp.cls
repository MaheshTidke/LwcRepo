@istest
public class testaccountwithopp 
{
    @testsetup
    
    public static void testaccountwithopp()
    {set<id> aa = new set<id>();
		account a = new account(name='dummys',NumberOfEmployees=5);  
     aa.add(a.id);      
    insert a;
        
    }
    @istest
    public static void testdata()
    {
	list<account> opl = [select id,name,(select id,name from opportunities where name = 'triggeropp11') from account];
        integer p=0;
        string namee;
        for(account a : opl)
        {
            p = a.opportunities.size();
            for(opportunity ol :a.opportunities)
            {
                namee = ol.name;
            }
        }
        system.assertEquals(1,p);
        system.assertEquals('triggeropp11',namee);        
	}
}