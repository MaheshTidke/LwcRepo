import { LightningElement,api } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
export default class Deleterecordwirefunction extends LightningElement 
{
    @api recordId

    handlclick(event)
    {
        console.log('clicked delete button')
        deleteRecord(this.recordId).catch((data)=>{
            console.log('deleted record'+this.recordId);
        }).catch((err)=>{
            console.log(err);
        })
    }
}