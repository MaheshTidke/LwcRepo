public class datatypeapex 
{
	public void mahesh()
    {  
        list<account> acclist = [select id, name from account limit 2];
        system.debug(acclist);
    }
}