global class callingincoinvalue
{
    global class j
    {
       @InvocableVariable
        global string coinname;
        @InvocableVariable
        global string currencyname;
    }
    @invocablemethod(label = 'getcoindata')
    global static list<double> createe(list<j> klis1)
    {
     	string coin = klis1.get(0).coinname; 
        string curency = klis1.get(0).currencyname;  
        double coinvalue = getcryptodatarest.call1(curency,coin);
        list<decimal> v = new list<decimal>();
        v.add(coinvalue);
        return v;
    }
}