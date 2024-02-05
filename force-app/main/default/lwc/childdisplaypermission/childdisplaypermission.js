import { LightningElement,track,wire } from 'lwc';
import objapinames from '@salesforce/apex/Objectapinamesofclass.objapinames'
import profnames from '@salesforce/apex/getpofilename.profnames'
import getpermissioncrud from '@salesforce/apex/getpermissiondata.getpermissioncrud'
import getfieldpermissioncrud from '@salesforce/apex/getfieldpermissiondata.getfieldpermissioncrud'
import PermiMessageChannel from '@salesforce/messageChannel/PermiMessageChannel__c';
import { publish,subscribe,MessageContext } from 'lightning/messageService';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

// const columns = [
//     { label: 'ObjectName', fieldName: 'ObjectName',type: 'text'  },
//     { label: 'ProfileName', fieldName: 'ProfileName',type: 'text'  },
//     { label: 'Create', fieldName: 'PermissionsCreate',type: 'Boolean'  },
//     { label: 'Read', fieldName: 'PermissionsRead',type: 'Boolean' },
//     { label: 'Edit', fieldName: 'PermissionsEdit',type: 'Boolean'  },
//     { label: 'Delete', fieldName: 'PermissionsDelete',type: 'Boolean'  },
//     { label: 'ViewAllRecords', fieldName: 'PermissionsViewAllRecords',type: 'Boolean'  },
//     {label: 'ModifyAllRecords', fieldName: 'PermissionsModifyAllRecords',type: 'Boolean'  }

//{ label: 'Sr. No', fieldName: 'Sr. No',type: 'Number'  },
    
// ];
const columns = [
    { label: 'ObjectName', fieldName: 'ObjectName',type: 'text'  },
    { label: 'ProfileName', fieldName: 'ProfileName',type: 'text'  },
     { label: 'Read', 
        fieldName: '',
        cellAttributes: { iconName: { fieldName: 'Read' } } },
    { label: 'Create',
        fieldName: '',
        cellAttributes: { iconName: { fieldName: 'Create' } }  },
    { label: 'Edit', 
        fieldName: '',
        cellAttributes: { iconName: { fieldName: 'Edit' } }  },
    { label: 'Delete', 
        fieldName: '',
        cellAttributes: { iconName: { fieldName: 'Delete' } }  },
    { label: 'ViewAllRecords', type: 'boolean',editable: true,
        fieldName: '',
        cellAttributes: { iconName: { fieldName: 'ViewAllRecords' }
        }},
    {label: 'ModifyAllRecords',
        fieldName: '',
        cellAttributes: { iconName: { fieldName: 'ModifyAllRecords' }
          }
    }
    
];
// {label: 'ModifyAllRecords', type: 'boolean',editable: true,
//         fieldName: 'ModifyAllRecords',
//         cellAttributes: { iconName: { fieldName: 'ModifyAllRecords' } }  }
export default class Childdisplaypermission extends LightningElement 
{
    enableRowNumber=true
    columns = columns;
    data = [];
    objapinamearray
    objpermis
    objfieldpermis
    profarray
    options
    optionspermisobj=[];
    optionsofprofile
    optionsfieldpermisobj
    selectedobj
    selectedprof
    selectedprofs=[]
    objectinputtext =''
    inputobj=''
    inputprof=''
    profinputtext=''
    @track filteredobjnamesarray
    @track filteredprofnamesarray
    @track pilssarray=[]
    
    


    @wire(MessageContext)
    context


    connectedCallback()
    {
        this.getobjnames()
        this.getprofnames()
        //this.getpermissioncrudobj()
    }

    getobjnames()
    {
        objapinames().then((data)=>{
            this.objapinamearray = data
           // console.log(this.objapinamearray)
            this.options = this.objapinamearray.map((item)=>{
                return { label: item.QualifiedApiName
                    , value: item.QualifiedApiName }
            })
        }).catch((error)=>{
            console.log(error)
        })
    }

    getprofnames()
    {
        profnames().then((data)=>{
            this.profarray = data
            //console.log(this.profarray)
            this.optionsofprofile = this.profarray.map((item)=>{
                return { label: item.Name
                    , value: item.Name }
            })
        }).catch((error)=>{
            console.log(error)
        }) 
    }

    handleobjectnamechange(event)
    {
        this.objectinputtext = event.target.value.toLowerCase();
       this.filteredobjnames();
        //console.log(this.objectinputtext)
    }

    filteredobjnames()
    {
        if(this.objectinputtext === '')
        {
            this.filteredobjnamesarray=[]
        }
        else{
            this.filteredobjnamesarray= this.options.filter((objn)=> objn.label.toLowerCase().includes(this.objectinputtext))
        }
        

    }
    handlefilterclick(event)
    {
        this.selectedobj= event.target.textContent
        console.log(event.target.textContent)
        this.inputobj = this.selectedobj
        this.filteredobjnamesarray=[]
    }

    
    handleproifinp(event)
    {
        this.profinputtext = event.target.value.toLowerCase();
       this.filteredprofnames();
    }

    filteredprofnames()
    {
        if(this.profinputtext === '')
        {
            this.filteredprofnamesarray=[]
        }
        else{
            this.filteredprofnamesarray= this.optionsofprofile.filter((objn)=> objn.label.toLowerCase().includes(this.profinputtext))
        }
    }
    handlefilterprofclick(event)
    {
        const seleprof= event.target.textContent
        console.log(seleprof)
        // const isseel =  
        // console.log(isseel)
        if(this.selectedprofs.includes(seleprof))
        {
            this.selectedprofs.remove(seleprof);
            // event.target.classList.add("ho");
            
        }
        else{
            this.selectedprofs.push(seleprof);
            this.pilssarray.push(seleprof);
        }
        //console.log(this.selectedprofs)
        
        
        // console.log(event.target.textContent)
        // this.inputprof = this.selectedprof
        // this.filteredprofnamesarray=[]
        // if(
    }
    handleRemovepill(event)
    {
        //this.pilssarray.remove(event.target.label);
        this.pilssarray=  this.pilssarray.filter(pril=> pril !== event.target.label)
        this.selectedprofs = this.pilssarray.filter(pril=> pril !== event.target.label)

        
        // console.log(event.target.label);
    }
    clearallprof()
    {
        this.pilssarray=[]
        this.selectedprofs=[]
    }
    Addallprof()
    {
        this.pilssarray=this.optionsofprofile.map(item=> item.value)
        this.selectedprofs=this.optionsofprofile.map(item=> item.value)
        // this.pilssarray=[]
        // this.selectedprofs=[]
    }

    
    

    // handleChange(event)
    // {
    //     console.log(event)
    //     this.selectedobj = event.detail.value
    // }

    handlc(event)
    {
        
        this.selectedprof = event.detail.value
    }
    handleobjclick()
    {
        // console.log(this.selectedprof)
        // console.log(this.selectedobj)
        getpermissioncrud({prname:this.pilssarray,objn:this.selectedobj}).then((data)=>{
            this.objpermis = data
            console.log(this.objpermis)
            this.optionspermisobj = this.objpermis.map((item)=>{
                return { 
                    ObjectName:this.selectedobj,
                    ProfileName:item.Parent.Profile.Name,
                    Create:item.PermissionsCreate?'action:approval':'action:close', 
                    Read:item.PermissionsRead?'action:approval':'action:close', 
                    Edit:item.PermissionsEdit?'action:approval':'action:close', 
                    Delete:item.PermissionsDelete?'action:approval':'action:close',
                    ViewAllRecords:item.PermissionsViewAllRecords?'action:approval':'action:close',
                    ModifyAllRecords:item.PermissionsModifyAllRecords?'action:approval':'action:close' }
            })
        }).catch((error)=>{
            console.log(error)
        })
        //  ViewAllRecords:item.PermissionsViewAllRecords?'action:approval':'action:close',

        getfieldpermissioncrud({profnamee:this.selectedprof,objectapinn:this.selectedobj}).then((data)=>{
            this.objfieldpermis = data
            //console.log(this.objfieldpermis)
            const message={
                pmsdata:{
                    valuee:this.objfieldpermis,
                    prname:this.selectedprof,
                    oname:this.selectedobj
                }   
            }
            
            publish(this.context,PermiMessageChannel,message)
            // this.optionsfieldpermisobj = this.objfieldpermis.map((item)=>{
            //     return { 
            //         ObjectName:this.selectedobj,
            //         ProfileName:this.selectedprof,
            //         Create:item.PermissionsCreate?'action:approval':'action:close', 
            //         Read:item.PermissionsRead?'action:approval':'action:close', 
            //         Edit:item.PermissionsEdit?'action:approval':'action:close', 
            //         Delete:item.PermissionsDelete?'action:approval':'action:close',
            //         ViewAllRecords:item.PermissionsViewAllRecords?'action:approval':'action:close',
            //         ModifyAllRecords:item.PermissionsModifyAllRecords?'action:approval':'action:close' }
            // })
        }).catch((error)=>{
            console.log(error)
        })

    }

    
}