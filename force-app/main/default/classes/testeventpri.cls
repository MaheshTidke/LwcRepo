@istest
public class testeventpri 
{
	@istest
	public static void testt()
    {
        string h = eventpri.eve('CA');
        system.assertEquals('high','high');
        string hq = eventpri.eve('CAa');
		 system.assertEquals('null','null');
         string hqq = eventpri.eve('Cs');
		 system.assertEquals('low','low');
       
    }
}