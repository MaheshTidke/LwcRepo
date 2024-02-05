import { LightningElement, wire,api } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import Contactobj from '@salesforce/schema/Contact';
//import acountid field of contact
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class Createfunctionwire extends LightningElement 
{
    @api recordId

formfields={
    AccountId : ''
    }

    //accountid
    
    changehandler(event)
    {
        const {name,value} = event.target
        this.formfields[name]= value
        
    }
    
    cretecon()
    {
        console.log(this.recordId);
        console.log(this.formfields)
        
        this.formfields.AccountId=this.recordId
        const recordInput = {apiName:Contactobj.objectApiName,fields:this.formfields}
        createRecord(recordInput).then((res)=>{  
                this.showtast('success creating contact with id',`contact created with id ${res.id}`,'success')
                this.template.querySelector('form.Createcon').reset()
                this.formfields= {}
        })
        .catch((err)=>{
            this.showtast('Error Creating record',err.body.message,'error')
        })
    }

    showtast(title,message,variant)
    {
        this.dispatchEvent
        (
            new ShowToastEvent
            (
                {
                    title,
                    message,
                    variant: variant || 'success'
                }
            )
        )
    }
}