@istest
public class testusecase5 
{
    @istest
    public static void testt()
    {
      list<account> a = new list<account>();
        for(integer i = 0 ;i < 3;i++)
        {
            account aa = new account(name = 'something',Rating = 'Cold',CustomerPriority__c='Low');
            a.add(aa);
        }
        insert a;
        set<id> f = new set<id>();
       list<opportunity> op = new list<opportunity>();
        for(account ff :a)
        {
            f.add(ff.id);
            opportunity vb = new opportunity(StageName='Prospecting', CloseDate=system.today(),name = 'somewhat',amount=12000,accountid = ff.id);
            op.add(vb);
		}
        insert op;
        
        list<account> m = [select id,name,Rating,CustomerPriority__c from account where id in :f];
        system.assertEquals('Hot',m[2].Rating);
        system.assertNotEquals('Cold',m[2].Rating);
	}
}