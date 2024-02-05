public class accindustry 
{
    public static void asdf()
    {
        string sf = 'energy';
        list<account> n = new list<account>();
        n = [select name, Industry,(select name from contacts where name like '%as%') 
             from account where name like '%as%' and industry not in ('electronics')];
		for(account v :n)
        {system.debug(v);
            for(contact c :v.contacts)
            {
            system.debug(c);
        	}	
        }//hi
    }
}