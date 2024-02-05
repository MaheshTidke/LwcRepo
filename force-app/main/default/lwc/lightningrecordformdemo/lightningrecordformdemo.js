import { LightningElement,api } from 'lwc';
import accountobj from '@salesforce/schema/Account'
import name from '@salesforce/schema/Account.Name'
import typea from '@salesforce/schema/Account.Type'
import {ShowToasEvent} from 'lightning/platformShowToastEvent';
export default class Lightningrecordformdemo extends LightningElement 
{
    @api recordId
    objectapinamee = accountobj;
    fieldlist = {
        name,
        typea
    };


}