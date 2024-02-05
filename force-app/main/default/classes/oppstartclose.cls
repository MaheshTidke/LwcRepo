public class oppstartclose 
{
    public static void passdate()
    {
        Date start = date.newinstance(2022,01,16);
        Date close = date.newinstance(2022,02,18);  
        stcl(start,close);
    }
    public static void stcl(date start, date close)
    {
        string s= 'Mahesh Tidke';
        date d;
        d= Date.newInstance(2022,01,16);
        list<Opportunity> op = new list<Opportunity>();
        op = [select name, CloseDate, Owner.Name
              from opportunity 
              where CloseDate > :start and CloseDate < :close and Owner.Name= :s];
        for(Opportunity l : op )
        {
            system.debug('Name = '+l.Name+'|| Close Date = '+l.CloseDate+ '||Owner Name = '+l.Owner.Name);
        }
        
    }

}