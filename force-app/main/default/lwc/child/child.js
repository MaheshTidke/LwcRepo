import { LightningElement, api } from 'lwc';

export default class Child extends LightningElement {

    @api message
    constructor()
    {
        super()
        //console.log("this is a child constructor")
    }

    connectedCallback()
    {
        //console.log("this is a child connectedcallback")
    }

    renderedCallback()
    {
        //console.log("this is child rendercallback")
    }
    disconnectedCallback()
    {
        //alert('this is fired beacause of child disconnected callback')
    }
}