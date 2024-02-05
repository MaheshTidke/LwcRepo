@istest
public class testbillacconship 
{
    @istest
    public static void testinsert()
    {
        list<account> accd = new list<account>();
        for(integer i = 0;i<5;i++)
        {
            account a = new account();
            a.name='account'+i;
            a.BillingCity = 'Norway';
            accd.add(a);
        }
        insert accd;
        accd[1].BillingCity='l';
        for(account ab : accd)
        {
            ab.BillingCity='chandigarh';
            
        }
        update accd;
        list<contact> con = new list<contact>();
        for(account a : accd)
        {
            for(integer o = 1;o<5;o++)
            {
                contact c = new contact(lastname = 'contact'+o,accountid=a.id);
                con.add(c);
            }
        }
        insert con;
        for(account x :accd)
        {
            for(contact z :x.contacts)
            {
                //string Bill=x.BillingCity;
                //string maill=z.Mailingcity;
                system.assertEquals(x.BillingCity,z.Mailingcity);
            }
        }
    }
}