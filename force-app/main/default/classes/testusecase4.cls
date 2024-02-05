@istest
public class testusecase4 
{
    @istest
    public static void usecasetest()
    {
        account a = new account(name = 'mahesh');
        insert a;
        opportunity o = new opportunity(name = 'maheshtest',stagename = 'Closed Won',closedate=system.today(),accountid = a.id);
        insert o;
        
        delete o;
        //system.Assertequals('');
    }

}