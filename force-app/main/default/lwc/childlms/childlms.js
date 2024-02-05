import { LightningElement, wire } from 'lwc';
//import sampl from '@salesforce/messageChannel/sampl__c';
import { subscribe,MessageContext, APPLICATION_SCOPE, unsubscribe } from 'lightning/messageService';
export default class Childlms extends LightningElement {

    @wire(MessageContext)
    context
    sss
    dismessage 
    sub
    setcondition 
    sss 


    connectedCallback()
    {
        this.setcondition = true
        this.sss = "Subscribe Mode"
        this.subscribemessage()
        //console.log("connected callback")

    
    }

    
    subscribemessage()
    {
        this.sub = subscribe(this.context,sampl,(message)=>{this.showdata(message)},{scope:APPLICATION_SCOPE})
        //console.log("hii subscribe")
    }

    showdata(message)
    {
        this.dismessage = message.lmsdata.valuee?message.lmsdata.valuee:'No Message Published'
        //console.log(this.dismessage)
    }

    handlunscubscribe()
    {
        unsubscribe(this.sub)
        this.sub = null

        this.sss = "Unsubscribe Mode"
        this.setcondition = false
        
    }
    handlscubscribe()
    {
        this.sss = "Subscribe Mode"
        this.setcondition = true
        //this.sub = subscribe(this.context,sampl,(message)=>{this.showdata(message)},{scope:APPLICATION_SCOPE})
        this.subscribemessage()
    }
}