public class infunction 
{
    public static void inn()
    {
        list<account> n = new list<account>();
        list<string> s = new list<string>{'qazxc','bas','sForce'};
        n = [select name from account where name in :s and CreatedDate = THIS_QUARTER];
        for( account c :n)
        {
            system.debug(c);
        }
    }}