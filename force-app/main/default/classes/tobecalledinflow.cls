global class tobecalledinflow 
{
    global class j
    {
       @InvocableVariable
        global integer num;
        @InvocableVariable
        global account acl;
    }
    @invocablemethod(label = 'createconforacc')
    global static void createe(list<j> klis)
    {
       // restt.call();
        list<contact> conlis = new list<contact>();
       account p = klis.get(0).acl;
        system.debug(klis.get(0).num);
        integer i = 0;
     if(!klis.isempty())
     {
          for(integer k =0;k<klis.get(0).num;k++)
             {
                 contact c = new contact(lastname = 'createdbyflowapexaction '+k,accountid = p.id);
                 
                 conlis.add(c);
             }
         
         
     }
         for(contact acx : conlis)
         {
             system.debug(acx.name);
         }
     if(!conlis.isempty())
     {
         insert conlis;
     }
     system.debug(conlis);
    }
    
}