import { LightningElement, wire,track} from 'lwc';
import accobj from '@salesforce/schema/Account';
import accobjind from '@salesforce/schema/Account.Industry';
import {getObjectInfo,getPicklistValues} from 'lightning/uiObjectInfoApi';

export default class Getpicklistvalueswore extends LightningElement 
{
    acco = accobj
    dataobj
     pickval
    optionss=[]
    @track bydefaultvalue =null;

    @wire(getObjectInfo, {objectApiName:'$acco'})
    accobjprop
    

    @wire(getPicklistValues, { recordTypeId:'$accobjprop.data.defaultRecordTypeId', fieldApiName:accobjind})
        industryPicklist({data, error}){
            if(data){
                //console.log(data.values)
                this.optionss = this.generatePicklist(data)
            }
            if(error){
                //console.error(error)
            }
        }

        generatePicklist(data){
            return data.values.map(item=>
            (
                { label: item.label, value: item.value }
            )
            )
        }
        handleChange(event) {   
            this.bydefaultvalue = event.detail.value;
           // const dataaa = this.bydefaultvalue;
            console.log(this.bydefaultvalue)
            const vb = this.template.querySelector('c-apexwire');
            vb.callchild(this.bydefaultvalue);
        }
        handleapp(evg)
        {
            this.bydefaultvalue=evg.detail.valuel
            const vb = this.template.querySelector('c-apexwire');
            vb.callchild(this.bydefaultvalue);
        }

    
    
}