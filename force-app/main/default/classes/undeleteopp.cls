public class undeleteopp 
{
    public static void un()
    {
        list<Opportunity> aws = new list<Opportunity>();
        aws = [select name,IsDeleted,LastModifiedDate from Opportunity where IsDeleted = true and (LastModifieddate = Today) ALL rows];
        //system.debug(aws);
        undelete aws;
    }

}