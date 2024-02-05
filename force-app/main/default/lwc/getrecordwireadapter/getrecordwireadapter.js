import { LightningElement,api,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import Accountobj from '@salesforce/schema/Account';
import accname from '@salesforce/schema/Account.Name';
import accAnnualRevenue from '@salesforce/schema/Account.AnnualRevenue';
import accowner from '@salesforce/schema/Account.Owner.Name';

export default class Getrecordwireadapter extends LightningElement 
{
    accnam
    accAnnu
    accown

    @api recordId

    @wire(getRecord,{recordId:'$recordId',fields:[accname,accAnnualRevenue,accowner]})
    storerecord({data})
    {
        if(data)
        {
            //console.log(data);
            this.accnam = data.fields.Name.displayValue ? data.fields.Name.displayValue : data.fields.Name.value
            this.accAnnu = data.fields.AnnualRevenue.displayValue ? data.fields.AnnualRevenue.displayValue : data.fields.AnnualRevenue.value
            this.accown = data.fields.Owner.displayValue ? data.fields.Owner.displayValue : data.fields.Owner.value
        }
    }
}