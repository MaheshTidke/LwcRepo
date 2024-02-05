public class createtask 
{
    public static void ui()
    {
        list<opportunity> opl = new list<opportunity>();
        list<task> ta = new list<task>();
        opl  = [select id,name from opportunity limit 50];
        for(opportunity o  :opl)
        {
            task n = new task(whatid = o.id, Priority='high');
            ta.add(n);
        }
        insert ta;
    }
}