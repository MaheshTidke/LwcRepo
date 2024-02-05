public class deleteacc {
    public static void ss()
    {
        list<account> b = new list<account>();
        b= [select name from account where name like '%roll%'];
        database.delete (b);
        system.debug(b);
    }

}