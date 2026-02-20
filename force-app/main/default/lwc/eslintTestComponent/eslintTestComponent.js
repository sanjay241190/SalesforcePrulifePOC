import { LightningElement, api } from 'lwc';

export default class eslintTestComponent extends LightningElement { // ❌ Naming convention issue

    @api recordId

    connectedCallback() {
        console.log("Component Loaded") // ❌ no-console
        let unusedVar = 10 // ❌ no-unused-vars
        if (recordId == null) { // ❌ eqeqeq violation
            document.querySelector("body") // ❌ no-document-query
        }
    }

    handleClick(){
      if(true){
      console.log("clicked") // ❌ no-console
      }
    }
}