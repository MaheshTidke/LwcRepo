public class deleteopp 
{
    public static void del()
    {
        list<opportunity> li = new list<opportunity>();
        li = [select name from opportunity where name like 'custom%'];
        database.delete(li);
        system.debug('deleted');
    }

}