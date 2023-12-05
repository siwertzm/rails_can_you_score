import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="foot"
export default class extends Controller {
  static targets = [ "link" ]
  connect() {
    console.log("Hello, Stimulus!")
    this.linkTargets.forEach(element => {
      element.addEventListener("click", (event) => {
        event.preventDefault();
        const url = element.href;
        setTimeout(() => {
          window.location.href = url;
        }, 700);
      });
    });
  }
}
