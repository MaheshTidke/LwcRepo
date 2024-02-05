public class dml52 
{
    public static void dds()
    {   
        Date startDate = date.newinstance(2022, 10, 12);
        Date endDate = date.newinstance(2022, 10, 14);
        
        List<Account> lstAcc = [SELECT id,IsDeleted,LastModifiedDate,LastModifiedBy.Name FROM Account WHERE IsDeleted = true and LastModifiedById='0055j000005Q09JAAS' and (LastModifiedDate >: startDate AND LastModifiedDate <:endDate) ALL rows];
        for(account a :lstAcc)
        {
        system.debug('deleted records lst --> ' + a);
    	}
        undelete lstacc;
        system.Debug(lstAcc);
        
	}

}