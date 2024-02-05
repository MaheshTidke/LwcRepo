import { LightningElement,track,api } from 'lwc';

export default class Todo extends LightningElement {

    @api message 

    usernames = ['mahesh','dinesh','askhay','sanket']
    @track tasks = [
        {
        id:1,
        taskname:"demo"
        },
        {
        id:3,
        taskname:"demo task"
        }
    ]
    count = 2
    @track taskinputval
    callonchange(evb)
    {
        
        //this.taskinputval = evb.target.value
        //console.log(this.taskinputval)
    }
    handleClick(event)
    {   
        event.preventDefault()  
        
        let rr = this.template.querySelector("lightning-input").value
        console.log(this.taskinputval)
        this.tasks = [...this.tasks,{id:this.count,taskname:rr}]
        localStorage.setItem(this.count, rr)
        console.log(this.tasks)
        count++
    }
    percent 
    get setwidth()
    {
        return `width:${this.message}%`
        
    }

    handlech(rvr)
    {   
        this.message=rvr.target.value

    }
    /*clickme()
    {
         const varr = this.template.querySelectorAll('.users')
         Array.from(varr).forEach(element => {
            console.log(element.innerText);
            ele = this.template.createElement("h1")
            ele.textContent = "mahesh"
            element.appendChild(ele)
         });
    }*/
}