public class cc 
{
    public static void para()
    {
        string o = 'public';
        integer e =  404;
        integer e1 = 3000;
        emp(o,e,e1);
    }
    public static void emp(string o,integer e,integer e1)
    {
        list<account> lq = new list<account>();
        lq = [select name,Ownership, NumberOfEmployees from account where ownership = :o and NumberOfEmployees> 404 and NumberOfEmployees <: 3000];
        for(account w : lq)
        {
            system.debug(w);
        }
    }

}