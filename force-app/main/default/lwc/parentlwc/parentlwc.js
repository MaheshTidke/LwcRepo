import { LightningElement,track } from 'lwc';

export default class Parentlwc extends LightningElement {
    x
    ismodal = false
    mdg

    settgettobj = {
        name:"mahesh salesforce developer",
        age: 23,
        company:"Cognizant",
        location:"pune"
    }

    handlemodal()
    {
        this.ismodal = !this.ismodal
    }
    closeit(eet)
    {
        this.ismodal = false
        this.mdg = eet.detail
    }
    handlionchange(er)
    {
        this.x = er.target.value
    }

    plhandl(eve)
    {
        console.log("this is from a reset button")
        this.template.querySelector('c-childlwc').childreset()
    }

    @track carsoulobj = [
        {
            src : "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-01.jpg",
            header: "First Card",
            description : "First card description.",
            alternativetext : "First card accessible description.",
            href : "javascript:void(0);"
        },
        {
            src : "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-02.jpg",
            header: "Second Card",
            description : "Second card description.",
            alternativetext : "Second card accessible description.",
            href : "javascript:void(0);"
        },
        {
            src : "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-03.jpg",
            header: "Third Card",
            description : "Third card description.",
            alternativetext : "Third card accessible description.",
            href : "javascript:void(0);"
        }
    ]
}