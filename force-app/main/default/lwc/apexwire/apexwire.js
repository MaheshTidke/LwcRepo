import { LightningElement,wire,api } from 'lwc';
import vv from '@salesforce/apex/getaccountlistforwire.getaccountlistforwiredemo'
import { deleteRecord } from 'lightning/uiRecordApi';
import { updateRecord } from 'lightning/uiRecordApi';


const actions = [
    { label: 'Delete', name: 'delete' },
];

const columns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name',editable:true},
    { label: 'AnnualRevenue', fieldName: 'AnnualRevenue'},
    { label: 'Industry', fieldName: 'Industry'},
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    }];

export default class Apexwire extends LightningElement
{
    draftValues
    accounts = [];
    columns =columns
    as
    @api indusstry

    
    // @wire(vv,{ml:'$indusstry'})
    // prop({data,err}){
    //     if(data != null)
    //     {
    //         console.log(this.indusstry)
    //         console.log(data)
            
    //         this.accounts = data
    //     }
    //     if(err)
    //     {
    //         this.accounts=''
    //     }
    // }
//ha child invoke nhi hota ahe 
    @api callchild(as)
    {
        console.log('hiii');
        vv({ml:as}).then((res)=>{
            this.accounts=res
        }).catch((err)=>{
            //console.log(err);
            this.accounts=''
        })
        
    }
    handlchildclick(eve)
    {
        // new dispatchEvent(
        //     new CustomEvent('changetoappa', {
        //         // detail contains only primitives
        //         detail: {
        //             valuel:'Apparel'
        //         }
        //     }
        //     )
        // )
        const event = new CustomEvent('changetoappa', {
            // detail contains only primitives
            detail:  {
                       valuel:'Apparel'
                    }
        });
        // Fire the event from c-tile
        this.dispatchEvent(event);
    }
    handlsave(eve)
    {
        const onjj =[]
        console.log(eve.detail.draftValues.target)
        console.log(eve.detail.draftValues.slice())
        
         eve.detail.draftValues.map((item)=>{
            console.log(item)
            onjj = Object.assign({},item)
            console.log(onjj)
        })
    }

    
    // handleRowAction(event) {
    //     const actionName = event.detail.action.name;
    //     const row = event.detail.row;
    //     switch (actionName) {
    //         case 'delete':
    //             console.log(row)
    //             console.log(JSON.stringify(row.id));
    //             console.log(row.id);
    //             console.log(row);
    //             //this.deleteRow(row.id);
    //             break;
    //         default:
    //     }
    // }

    // deleteRow(ids)
    // {
    //     deleteRecord(ids).then((data)=>{
    //         console.log(data)
    //     }).catch((err)=>{
    //         console.error(err)
    //     })
    // }
}