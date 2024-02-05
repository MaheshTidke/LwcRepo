import { LightningElement,wire } from 'lwc';
import getfieldpermissioncrud from '@salesforce/apex/getfieldpermissiondata.getfieldpermissioncrud'
import PermiMessageChannel from '@salesforce/messageChannel/PermiMessageChannel__c';
import { publish,subscribe,MessageContext } from 'lightning/messageService';
//import {getEffectiveFieldAccess} from 'lightning/wireService'
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";


const columns = [
    { label: 'Field', fieldName: 'Field',type: 'text'  },
    { label: 'Read',
        fieldName: '',
        cellAttributes: { iconName: { fieldName: 'PermissionsRead' } }  },
    { label: 'Edit', 
        fieldName: '',
        cellAttributes: { iconName: { fieldName: 'PermissionsEdit' } } }
    
];


export default class Fieldpermissionlwc extends LightningElement 
{
    acc = ACCOUNT_OBJECT
    optionsfielddpermisobj
    columns = columns;
    optiondata
    obnjnamee

    @wire(MessageContext)
    context

    // @wire(getEffectiveFieldAccess,{recordId:'',objectApiName:''})
    // effec;
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountObject({error, data}){
        if(data){
            //console.log(data);
        }else{
            console.log(error);
        }
    }

    


    connectedCallback()
    {
        this.lmsmethod();
        
    }
 
    

    lmsmethod()
    {
        this.sub = subscribe(this.context,PermiMessageChannel,(message)=>{this.showdata(message)})
        //console.log("hii subscribe")
    }

    showdata(message)
    {
        this.optionsfielddpermisobj = message.pmsdata.valuee?message.pmsdata.valuee:'No Message Published'
        this.obnjnamee = message.pmsdata.oname?message.pmsdata.oname:'No Message Published'
        //console.log(this.optionsfielddpermisobj)
        
        this.optiondata = this.optionsfielddpermisobj.map((item)=>{
            //console.log(item.Field.slice(this.obnjnamee.length+1))
            return {
                Field:item.Field.slice(this.obnjnamee.length+1),
                PermissionsRead:item.PermissionsRead?'action:approval':'action:close',
                PermissionsEdit:item.PermissionsEdit?'action:approval':'action:close'
            }
        })
    }
}