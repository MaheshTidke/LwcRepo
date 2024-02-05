import { LightningElement,wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import contactobj from '@salesforce/schema/Contact';
import firstname from '@salesforce/schema/Contact.FirstName';
import lastname from '@salesforce/schema/Contact.LastName';
import email from '@salesforce/schema/Contact.Email';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import { reduceErrors } from 'c/ldsUtils';
const COLUMNS = [
    { label: 'FirstName', fieldName: firstname.fieldApiName, type: 'text' },
    { label: 'LastName', fieldName: lastname.fieldApiName, type: 'text' },
    { label: 'Email', fieldName: email.fieldApiName, type: 'text' }
];
export default class ContactList extends LightningElement {
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
    columns = COLUMNS;
    @wire(getContacts)
    contacts

    get errors() {
        return (this.contacts.error) ?
            reduceErrors(this.contacts.error) : [];
    }
}