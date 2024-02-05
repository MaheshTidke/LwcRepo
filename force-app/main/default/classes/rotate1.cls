public class rotate1 {
    public static void ror()
    {
        integer i;
        final integer clock =5;
        final integer anticlock =7;
        list<integer> l1 = new list<integer>{23,45,78,2124,47,85,63,07,15,76,43};
            list<integer> l2 = new list<integer>{23,45,78,2124,47,85,63,07,15,76,43};
        
        
        /*for(i=0;i<l1.size();i++)
        {
            l2[math.mod((l1.size()+i-clock),(l1.size()))]=l1[i];
            //temp[(array.length+i-2)%(array.length)]= array[i];
        }
        system.debug(l2);
        l2.clear();*/
         
       
        /*int rotLeft(int arr[], int n, int d)
		{
            int i, j;
            int first;
            for(i=0; i<d; i++)
            {
                first = arr[0];
                for(j=0; j<n-1; j++)
                {
                    arr[j] = arr[j+1];
                }
                arr[j] = first;
            }
            return *arr;
        }*/
        integer j,k;
        integer temp;
        for(i=0;i<clock;i++)
        {
            temp = l1[0];
            for(j=0;j<l1.size()-1;j++)
            {
                l1[j]=l1[j+1];
            }
            l1[j]=temp;
        }
        system.debug(l1);
        
        
        /*int rotRight(int arr[], int n, int d)
        {
            int i, j;
            int first;
            for(i=0; i<d; i++)
			{ 
				first = arr[n-1]; 
				for(j=n-1; j>=0; j--)
                {
                    arr[j] = arr[j-1];
                }
                arr[0] = first;
            }
            return *arr;
        }*/
        integer o,p,first;
        for(o=0; o<anticlock; o++)
        {
            first = l2[l2.size()-1];
            for(p=l2.size()-1; p>0; p--)
            {
                l2[p] = l2[p-1];
            }
            l2[0]= first;
         }
        system.debug(l2);
    }

}