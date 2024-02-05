@istest
public class testupdatecreditscore 
{
	@istest
    public static void testmethoad()
    {

        list<transaction__c> listra = new list<transaction__c>();
        //list<transaction__c> listra = new list<transaction__c>();
        list<accounto__c> lisa = new list<accounto__c>();
        accounto__c ac = new accounto__c(name='maheshaccount',account_type__c='saving',Account__c='a075j0000078u6hAAA',balance__c=90000);
        lisa.add(ac);
        insert lisa;
        for(integer i = 0; i < 5; i++)
        { 
                transaction__c abc = new transaction__c(name ='mydeposite'+i,Accounttotran__c=ac.id,transaction_type__c='Deposit',Operation_Amount__c=90000);
                abc.operation_amount__c=null;
                listra.add(abc); 
        
        }
        insert listra;
        list<accounto__c> lisaq = new list<accounto__c>();
        set<id> vb = new set<id>();
        vb.add('a075j0000078u6hAAA');
        lisaq = [select id,credit_score__c from accounto__c where id in :vb];
        for(accounto__c j : lisaq)
        {
            system.assertEquals(4,j.credit_score__c,'passed brother');
		
        }
        
        
    }
    @istest
    public static void testmethoada()
    {

        list<transaction__c> listraa = new list<transaction__c>();
        //list<transaction__c> listra = new list<transaction__c>();
        list<accounto__c> lisaa = new list<accounto__c>();
        accounto__c ac = new accounto__c(name='maheshaccount',account_type__c='saving',Account__c='a075j0000078u6hAAA',balance__c=90000,credit_score__c=1);
        lisaa.add(ac);
        insert lisaa;
        for(integer i = 0; i < 5; i++)
        { 
                transaction__c abc = new transaction__c(name ='mydeposite'+i,Accounttotran__c=ac.id,transaction_type__c='Deposit',Operation_Amount__c=90000);
                abc.operation_amount__c=null;
                listraa.add(abc); 
        
        }
        insert listraa;
        list<accounto__c> lisaqa = new list<accounto__c>();
        set<id> vba = new set<id>();
        vba.add('a075j0000078u6hAAA');
        lisaqa = [select id,credit_score__c from accounto__c where id in :vba];
        for(accounto__c ja : lisaqa)
        {
            system.assertEquals(4,ja.credit_score__c,'passed brother');
		
        }
    }
}