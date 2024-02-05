public class research
{
    //Lets consider a Bank trnasaction interface which indeed used by 3 banks BankA, BankB and BankC
    public Interface bankTransactionInterface
    {
        double deposit();
        double withdrawal();
    }

    //We have to implement the two methods declared in the interface for BankA
    

    //We will take another class for BankB and declare it as virtual as it is parent of BankC which has different deposit porcess but same withdrawal process as BankB.
    //For this we have to declare the deposit method as virtual and use override keyword when overriding it for BankC like showed below
    public virtual class BankB implements bankTransactionInterface
    {
        public virtual double deposit()
        {
            //process the deposit
            double depositedAmount = 450;
            return depositedAmount ;
        }

        public double withdrawal()
        {
            //process the withdrawal
            double withdrawalAmount = 1000;
            return withdrawalAmount ;
        }
    }

    public class BankC extends BankB
    {
        public override double deposit()
        {
            //process the deposit
            double depositedAmount = 750;
            return depositedAmount ;
        }
    }
}