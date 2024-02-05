import { LightningElement,api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class Recordidandobjectapiname extends LightningElement {
    
    //record id from lcr page using @ api
    @api recordId
    // object api name from lcr page using @api
    @api objectApiName

    handltoast()
    {
        const toastbiscuit = new ShowToastEvent({
            title:"This is Toast",
            message:"{0} This is a message {1}",
            variant:"success",
            messageData:[
                'salesforce',{
                    url:'https://www.youtube.com/',
                    label:'Click to open YouTube'
                }
            ],
            mode:'sticky'
        })
        this.dispatchEvent(toastbiscuit)
    }

}