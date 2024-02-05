public class create1000acc 
{
    public static void cc()
    {
        list<account> aa = new list<account>();
        for(integer i =0;i<199;i++)
        {
            account vb = new account(name='batchapex');
            aa.add(vb);
            
        }
        insert aa;
    }

}