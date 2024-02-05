import { LightningElement, track } from 'lwc';

export default class Quizapp extends LightningElement {
    correctAnswer = 0
    selected={}
    issub = false
    myquestions = [
        {
            id:"question1",
            question:"Which one of the following is not the iterator loop ?",
            options:{
                a:"for: each",
                b:"iterator",
                c:"map loop"
            },
            correctans:"c"
        },
        {
            id:"question2",
            question:"you are learning which course ?",
            options:{
                a:"LWC",
                b:"zero to hero lwc",
                c:"admin & apex"
            },
            correctans:"b"
        },
        {
            id:"question3",
            question:"Which one of the following is in admin ?",
            options:{
                a:"lwc",
                b:"flow",
                c:"apex"
            },
            correctans:"b"
        }

    ]
    get allnotselected()
    {
    return !(Object.keys(this.selected).length === this.myquestions.length)
    }

    get isscoredfull()
    {
        return `slds-text-heading_large  ${this.myquestions.length === this.correctAnswers?
            'slds-text-color_success':'slds-text-color_error'} `
            
    }

    
    changehandler(event)
    {
        //console.log(event.target.name);
        //console.log(event.target.value);
        const {name ,value} = event.target
        this.selected = {...this.selected ,[name]:value}
        console.log(this.selected)
        
    }

    

    submitquiz(eve)
    {
        eve.preventDefault();
        let correct = this.myquestions.filter(item=>this.selected[item.id] === item.correctans)
        this.correctAnswers = correct.length
        console.log("this.correctanscount = ",this.correctAnswers)
        this.issub= true

    }
    resetquiz(ev) 
    {
        
        this.selected ={}
        this.correctAnswer=0
        this.issub = false
        
    }
}