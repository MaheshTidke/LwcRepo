public class getaccid 
{
    public void getid()
    {
        list<account> listacc = new list<account>();
        listacc = [select id,name from account limit 5];
        set<id> accid = new set<id>();
        system.debug(listacc);
        if(!listacc.isempty()){
            for(account acc : listacc)
            {
                accid.add(acc.name);
                           
            }}
        system.debug('account id =>'+accid);        
    }

}