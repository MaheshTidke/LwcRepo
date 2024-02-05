global class iplscore
{
    global class j
    {
       @InvocableVariable
        global string team001;
        @InvocableVariable
        global string team002;
         @InvocableVariable
        global date datew;
    }
    @invocablemethod(label = 'getiplscore')
    global static list<integer> createe(list<j> klis1)
    {
     	string t1 = klis1.get(0).team001; 
        string t2 = klis1.get(0).team002;
        date date1 = klis1.get(0).datew;
        //system.debug(t1);
        //system.Debug('date from flow'+date1);
        //return t1;
        
        //double score = 
        list<integer> sd =getiplscoreapi.call1q(t2,t1,date1);
        //list<decimal> v = new list<decimal>();
        //v.add(score);
        system.debug('sd === '+sd);
        return sd;
    }
}