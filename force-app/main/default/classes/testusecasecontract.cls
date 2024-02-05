@istest
public class testusecasecontract 
{
    @istest
    public static void vv()
    {
        
        list<account> n = new list<account>();
        for(integer i = 0;i<10;i++)
        {
            account a  = new account(name = 'testing usecase contract' + i );
            n.add(a);
    	}
        insert n;
        list<contract> w = new list<contract>();
        for(account gh : n)
        {
            contract vb = new contract(Status='Draft',StartDate=system.today(),ContractTerm=2,
                                       accountid =gh.id);
            w.add(vb);
        }
        test.startTest();
        insert w;
        test.stopTest();
        usecasecontract.hh();
        //system.assertEquals('testing usecase contract0',n[0].name);
        system.assertEquals('Draft',w[0].status);
    }

}