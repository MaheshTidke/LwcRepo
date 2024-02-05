import { LightningElement, api, wire } from 'lwc';
//import sampl from '@salesforce/messageChannel/sampl__c';
import animate from '@salesforce/resourceUrl/animate';
import {loadStyle} from 'lightning/platformResourceLoader';
import { publish,subscribe,MessageContext } from 'lightning/messageService';
import ll from '@salesforce/contentAssetUrl/lightningwebcomponents';
import haslwccust from '@salesforce/customPermission/lwccust';
import formfactor from '@salesforce/client/formFactor';
import idd from '@salesforce/user/Id';


export default class Parentlms extends LightningElement {
    fformfactor = formfactor
    userid = idd


    get storepermission() 
    {
        return haslwccust
        
    } 


    @wire(MessageContext)
    context
    m
    imgg = ll
    handlea(event)
    {
         this.m = event.target.value
         //console.log(this.m)
    }

    publishmsg()
    {
        //console.log("publishmessageonlcih ="+this.m)
        const message={
            lmsdata:{
                valuee:this.m
            }   
        }
        //console.log("message object"+this.message)

        publish(this.context,sampl,message)
    }

    renderedCallback()
    {
        loadStyle(this,animate+'/animate/animate.min.css').then(()=>{})
        .catch(()=>{})
    }
    showanimation()
    {
            
    }

}