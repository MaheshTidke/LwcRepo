@istest
public class testdml1 
{
    @istest
    public static void testt()
    {
        list<contact> vb = new list<contact>();
        vb.add(new contact(firstname = 'jarvis',lastname = 'stark'));
        vb.add(new contact(firstname = 'jarvis1',lastname = 'tony'));
        vb.add(new contact(firstname = 'arvis',lastname = 'hulk'));
        insert vb;
        
        dml1.conupdate();
        list<contact> vbv = new list<contact>();
        vbv= [select firstname,lastname from contact where firstname = 'jarvis'];
        system.assertequals('starktest',vbv[0].lastname);
        
    }

}