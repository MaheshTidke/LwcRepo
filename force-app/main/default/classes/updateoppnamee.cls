public class updateoppnamee 
{
    public static void ss()
    {
        list<opportunity> ll = new list<opportunity>();
        list<opportunity> lal = new list<opportunity>();
        ll = [select id,name from opportunity];
        for(integer i =0;i<10001;i++)
        {
            opportunity y = new opportunity(name = 'batch '+i,	CloseDate= system.today(),StageName='Perception Analysis');
			lal.add(y);
		        }insert lal;
    }

}