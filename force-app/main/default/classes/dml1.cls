public class dml1 
{
    
    public static void conupdate()
    {
        integer k=1;
        list<contact> conlist = new list<contact>();
        conlist = [select id,firstname,lastname from contact where name like 'j%'];
        
        system.debug(conlist);
        
        for(contact i : conlist)
        {
            i.lastname  = i.lastname + 'test';
            
        }
        
        update conlist;
        
    }
}