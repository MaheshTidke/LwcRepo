import { LightningElement, api} from 'lwc';

export default class Childsettergetter extends LightningElement {
    
    datashallow
    
    @api 
    get passsetget()
    {
        return this.datashallow
    }
    set passsetget(dataa)
    {
         let namme = dataa.name
         let loc = dataa.location
         namme = "Mahesh Tidke"
         loc = "PUNE"
        this.datashallow = {...dataa, name:namme,location:loc}
    }

    handlslotchange()
    {
        let foot = this.template.querySelector('.slds-card__footer')
        foot.classList.remove('slds-hide')
    }


}