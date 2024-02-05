import { LightningElement,wire } from 'lwc';
import { getObjectInfos } from 'lightning/uiObjectInfoApi';
import accobj from '@salesforce/schema/Account';
import oppobj from '@salesforce/schema/Opportunity';



export default class Wiregetobjectinfo extends LightningElement
{
 objlis = [accobj,oppobj];
 objdata
 ac
 @wire(getObjectInfos,{objectApiNames:'$objlis'})
 storeobj({data})
 {
    //console.log(data);
    this.objdata = data
    //console.log(this.objdata)
    // ac = this.objdata.results
    // console.log(ac)
 }


}