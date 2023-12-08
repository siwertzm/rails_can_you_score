import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "toggleable", "tablemoi", "tablemoi2", "toggleable2", "titre", "titre2" ]
  connect() {
    this.toggleableTarget.addEventListener("click", () => {
      this.tablemoiTarget.classList.toggle("d-none");
      this.tablemoiTarget.classList.toggle("pb-5");
      this.tablemoiTarget.classList.toggle("mb-5");
    });

    this.toggleable2Target.addEventListener("click", () => {
      this.tablemoi2Target.classList.toggle("d-none");
      this.titre2Target.classList.toggle("pb-5");
      this.titre2Target.classList.toggle("mb-5");
    });
  }
}
s
