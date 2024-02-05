import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class Navigationservice extends NavigationMixin(LightningElement) 
{
    navigatetohome()
    {
        this[NavigationMixin.Navigate]
        ({
            type:'standard__namedPage',
            attributes:{
                pageName:'home'
            }
        })
    }
    navigatetochatter()
    {
        this[NavigationMixin.Navigate]
        ({
            type:'standard__namedPage',
            attributes:{
                pageName:'chatter'
            }
        })
    }
}