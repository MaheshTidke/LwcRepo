import { LightningElement } from 'lwc';
export default class LwcLifeCycle extends LightningElement {
    
    mes = "this is child component"
    isvisible = false
    handleclick()
    {
        this.isvisible = !this.isvisible
    }
    constructor()
    {
        super()
        //console.log("this is a parent constructor")
    }

    connectedCallback()
    {
        //console.log("this is a parent connectedcallback")
    }
    

    renderedCallback()
    {
        //console.log("this is parent rendercallback")
    }
    disconnectedCallback()
    {
        //alert('this is fired beacause parent of disconnected callback')
    }
}