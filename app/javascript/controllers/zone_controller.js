import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="zone"
export default class extends Controller {
  static targets = ["clickableZone", "zoneId", "close", "modal"]

  connect() {
    this.clickableZoneTargets.forEach(element => {
      element.addEventListener("click", () => {
        console.log(element.getAttribute("data-zone-id"));
        this.zoneIdTarget.value = element.getAttribute("data-zone-id");
        element.classList.add("highlighted-zone")
        this.openModal();
      });
    });

    this.closeTarget.addEventListener("click", () => {
      this.clickableZoneTargets.forEach(element => {
        element.classList.remove("highlighted-zone")
        element.style.pointerEvents = "auto";
      });
      this.modalTarget.style.display = "none";
    });
  }

  openModal() {

    fetch(`/pages/zone_info/${this.zoneIdTarget.value}`)
      .then(response => response.json())
      .then(data => {
        // Vous pouvez maintenant utiliser les informations de la zone
        this.modalTarget.querySelector(".zone-info").innerText = data.description;
      });
    this.clickableZoneTargets.forEach(element => {
      element.style.pointerEvents = "none";
    })
    this.modalTarget.style.display = "block";

  }
}
