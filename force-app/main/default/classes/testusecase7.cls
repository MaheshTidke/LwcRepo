@istest
public class testusecase7 
{
    @istest
    public static void bb()
    {
        //create account
        list<account> aopl = new list<account>();
        for(integer i= 0;i<1;i++)
        {
			account aop = new account(name = 'name something');
            aopl.add(aop);
        }
        insert aopl;
        
        //create account related opportunities
        list<opportunity> opl = new list<opportunity>();
        for(account al :aopl)
        {
			opportunity op = new opportunity(accountid = al.id,StageName='Prospecting', 
                                             CloseDate=Date.newInstance(2022, 11, 11),name = 'somewhat');
            opl.add(op);
        }
        insert opl;
        set<id> accid = new set<id>();
        
        for(account a : aopl)
        {
            accid.add(a.id);
            for(opportunity ooo: a.opportunities)
            {
                ooo.closedate = Date.newInstance(2022, 11, 12);
                accid.add(ooo.id);
            }
        }
        /*for(opportunity bn: opl)
        {
            opid.add(bn.id);
            bn.CloseDate = Date.newInstance(2022, 11, 16);
            
        }
        list<opportunity> oplist = [select id,name,closedate,stagename from opportunity where id in :opid ];
		*/
		list<opportunity> oplist = [select id,name,closedate,stagename from opportunity where accountid in :accid ];
        system.debug(oplist);
        system.assertEquals('somewhat backup',oplist[0].name);
        
    }
	
}