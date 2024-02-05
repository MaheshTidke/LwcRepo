import { LightningElement } from 'lwc';
import signinn from './signinn.html';
import signup from './signup.html';
import renderComponent from './renderComponent.html';

export default class RenderComponent extends LightningElement {
    Selectedvalue= null

    
    render()
    {   
        if(this.Selectedvalue === 'SignIn')
        {
            return signinn
        }
        else if(this.Selectedvalue === 'SignUp')
        {
            return signup
        }
        else{
            return renderComponent
        }
    }

    handleclick(eve)
    {
        this.Selectedvalue = eve.target.label
    }

}