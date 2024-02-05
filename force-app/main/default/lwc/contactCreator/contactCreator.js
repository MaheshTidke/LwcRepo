import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import contactobj from '@salesforce/schema/Contact';
import firstname from '@salesforce/schema/Contact.FirstName';
import lastname from '@salesforce/schema/Contact.LastName';
import email from '@salesforce/schema/Contact.Email';
export default class contactCreator extends LightningElement {
    objectApiName = contactobj;
    fields = [firstname, lastname, email];
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "contact created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}