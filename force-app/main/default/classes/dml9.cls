public class dml9 
{
    public static void pass()
    {
        string s = 'account';
        co(s);
    }
    public static void co(string s)
    {
        string sQuery = 'Select count() from ' + s;
        integer i = database.countQuery(sQuery);
        system.debug(i);
    }
}