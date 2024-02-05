import { LightningElement } from 'lwc';

export default class Modalchild extends LightningElement {

    handlmodelclose()
    {
        const modalcloseevent = new CustomEvent('closee',{
            detail:"modal is closed now"
        })
        this.dispatchEvent(modalcloseevent)
    }
}