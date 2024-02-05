public class createtransa 
{
    public static void ma()
    {
        list<transaction__c> l = new list<transaction__c>();
        list<transaction__c> lq= new list<transaction__c>();
        l=[select id,name,Accounttotran__c from transaction__C where Accounttotran__c = 'a085j00000CKjUFAA1'];
        integer i = 0;
        for(transaction__c k : l)
        {
            k.name = 'dinesh'+i;
            lq.add(k);
            i++;
        }
        update lq;
    }

}