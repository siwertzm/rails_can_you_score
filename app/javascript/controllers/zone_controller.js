import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="zone"
export default class extends Controller {
  static targets = ["clickableZone", "zoneId", "close", "modal"]

  connect() {
    console.log("Zone controller connected");
    console.log(this.closeTarget);
    this.clickableZoneTargets.forEach(element => {
      element.addEventListener("click", () => {
        this.zoneIdTarget.value = element.getAttribute("data-zone-id");
        this.openModal();
      });
    });

    this.closeTarget.addEventListener("click", () => {
      this.modalTarget.style.display = "none";
    });
  }

  openModal() {
    this.modalTarget.style.display = "block";
  }
}
