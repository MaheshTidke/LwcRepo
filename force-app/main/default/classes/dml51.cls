public class dml51 
{
    public static void dd()
    {
		list<lead> b = new list<lead>();
        b = [select name from lead where name like 'b%' ALL ROWS];
        undelete b;
    }

}