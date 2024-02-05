import { LightningElement, api } from 'lwc';

export default class Childlwc extends LightningElement 
{
    @api daamessage
    @api caradata
    @api prv
    @api vall
    handlthis(rb)
    {
        this.vall = rb.target.value
        console.log(this.vall)
    }
    @api childreset()
    {
        console.log("this is from child reset function")
        this.vall = 10
        console.log(this.vall)
    }
}