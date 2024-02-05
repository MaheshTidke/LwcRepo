public class usecasecontract 
{
    public static void hh()
    {
        list<account> b = new list<account>();
        b = [select id,name from account  SECURITY_ENFORCED];
        list<contract> o = new list<contract>();
        for(account gh : b)
        {
            contract vb = new contract(Status='Draft',StartDate=system.today(),ContractTerm=2,accountid =gh.id);
            o.add(vb);
        }
        if(!b.isempty())
        {
            insert o;
        }
        
    }
}