import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "toggleable", "tablemoi", "tablemoi2", "toggleable2", "titre" ]
  connect() {
    this.toggleableTarget.addEventListener("click", () => {
      this.tablemoiTarget.classList.toggle("d-none");
      this.titreTarget.classList.toggle("pb-5");
      this.titreTarget.classList.toggle("mb-5");
    });

    this.toggleable2Target.addEventListener("click", () => {
      this.tablemoi2Target.classList.toggle("d-none");
      this.titreTarget.classList.toggle("pb-5");
      this.titreTarget.classList.toggle("mb-5");
    });
  }
}
