public class common {
    public static void co()
    {
        list<integer> l1 = new list<integer>{1,4,7,8};
        list<integer> l2 = new list<integer>{2,5,3,6,4,8,9};        
        list<integer> l3 = new list<integer>{9,5,2,7,4};
            
        l1.sort();
        l2.sort();
        l3.sort();
        
        integer s1,s2,s3=0;
        
        s1=l1.size();
        s2=l2.size();
        s3=l3.size();
        
        integer i=0;
        integer j= 0;
        integer k =0;
        while(i < s1 && j < s2 && k < s3) 
        {
            if(l1[i]==l2[j] && l2[j]==l3[k])
            {system.debug(l1[i]);
            i++;
            j++;
            k++;}
            else if(l1[i] < l2[j] || l1[i] < l3[k])
             {i++;}
            else if(l2[j] < l1[i] || l2[j] < l3[k]) 
            {j++;}
            else {k++;}
        }
        
    }
    
}