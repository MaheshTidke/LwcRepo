@istest
public class testusecase2helper 
{
    
	@istest
    public static void testda()
    {	account a = new account(name='usecase');
        insert a;
        
        opportunity o = new opportunity(name='usecaseopp',stagename='Prospecting',closedate=system.today(),accountid = a.Id);
        insert o;
		
     list<opportunity> vb = new list<opportunity>();
     	opportunity oq = new opportunity(name='usecaseopp',stagename='Prospecting',closedate=system.today(),accountid = a.Id);
        //insert oq;
     vb.add(oq);
     
     usecase2helper.help1(vb);
     insert vb;
        
     list<account> al = [select id,name,(select id,name from opportunities where name = 'usecaseopp duplicate name') from account];
     	for(account jk : al)
        {
            system.debug(jk.opportunities.size());
            for(opportunity gh :jk.opportunities)
            {
                //system.debug(gh.name);
                system.assertequals('usecaseopp duplicate name',gh.name,gh.name);
            }
        }
    }
}