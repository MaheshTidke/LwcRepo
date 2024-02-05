@restresource(urlmapping = '/getakash/*')
global class accountdata 
{
    @httpget
    global static String senddata()
    {
        list<account> aclist = new list<account>();
        
        restrequest req = restcontext.request;
        restresponse resp = restcontext.response;
        map<string,string> mapreq = req.params;
        //boolean check = boolean.valueOf(mapreq.get('closeopp'));
        //string rat = string.valueOf(mapreq.get('Rating'));
        string urifind = req.requestURI;
        string ids = string.valueof(urifind.substring(urifind.lastindexof('/')+1));
        string q = 'SELECT Id, IsDeleted, MasterRecordId, Name, Type, ParentId, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, BillingLatitude, BillingLongitude, BillingGeocodeAccuracy, BillingAddress, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, ShippingLatitude, ShippingLongitude, ShippingGeocodeAccuracy, ShippingAddress, Phone, Fax, AccountNumber, Website, PhotoUrl, Sic, Industry, AnnualRevenue, NumberOfEmployees, Ownership, TickerSymbol, Description, Rating, Site, OwnerId, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, LastViewedDate, LastReferencedDate, IsPartner, IsCustomerPortal, ChannelProgramName, ChannelProgramLevelName, Jigsaw, JigsawCompanyId, CleanStatus, AccountSource, DunsNumber, Tradestyle, NaicsCode, NaicsDesc, YearStarted, SicDesc, DandbCompanyId, OperatingHoursId, CustomerPriority__c, SLA__c, Active__c, NumberofLocations__c, UpsellOpportunity__c, SLASerialNumber__c, SLAExpirationDate__c, B2B_Total_Order_Amount__c, numberofcontact__c, noofopp__c, amount__c, emaill__c, closeopp__c, Totalopp__c FROM Account where id = :ids';
                account s = database.query(q);
        
        JSONGenerator jsGen = JSON.createGenerator(true);
                 
                jsGen.writeStartObject();
                
        		jsGen.writeFieldName('Account');
                jsGen.writeStartObject();
                jsGen.writeStringField('Id', s.Id);
                jsGen.writeStringField('Name', s.Name);
                jsGen.writeStringField('Industry', s.Industry);
                jsGen.writeStringField('Phone', s.Phone);
                jsGen.writeStringField('Account Type', s.Type);
                // end object (})
                jsGen.writeEndObject();
                
        		//jsGen.writeEndObject();
                string strJson = jsGen.getAsString(); 
        //String jsonString = JSON.serializePretty(s);
        //jsGen.createGenerator(s);
        
        return strJson;
    }
    //hi this is sahil branch
    
}