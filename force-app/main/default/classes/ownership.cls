public class ownership 
{
    public static void para()
    {
        string o = 'public';
        integer e =  404;
        integer e1 = 3000;
    }
    public static void emp(string o,integer e,integer e1)
    {
        list<account> lq = new list<account>();
        lq = [select name,Ownership, NumberOfEmployees from account where ownership = :o and NumberOfEmployees>:e and NumberOfEmployees<:e1];
        for(account w : lq)
        {
            system.debug(w.Name+'|||'+w.Ownership);
        }
    }

}