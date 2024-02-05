@Istest
public class testdml2 
{
    @testsetup
    public static void makedata()
    {
        list<account> acl = new list<account>();
        for(integer t= 0;t<9;t++)
        {
        	account a = new account(name='tesing'+t);
            acl.add(a);
        }
        insert acl;
    }
    
    @istest
    public static void testin()
    {
        test.startTest();
        dml2.meth();
        test.stoptest();
        list<account> a = [select id,name,(select id,name from opportunities) from account];
		string namee;
        integer opp=0;
        for(account v: a)
        {
            for(opportunity b : v.opportunities)
            {
                namee = b.name;
                system.assertEquals('tesing'+(opp++)+'First Opportunity',namee);
                system.debug(namee);
            }
        }
        //system.assertEquals('tesingFirst Opportunity',namee);
    }

}