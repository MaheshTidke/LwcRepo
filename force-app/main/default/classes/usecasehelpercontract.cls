public class usecasehelpercontract 
{
    public static void jk(list<contract> hj)
    {
        set<id> vb = new set<id>();
        
        for(contract c :hj)
        {
            vb.add(c.AccountId);
		}                 
        for(contract c :hj)
        {
            if(vb.contains(c.AccountId)==true)
            {
                c.adderror('you can not delete the associated account contract');
			}
		}
    }
}