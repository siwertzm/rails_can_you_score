document.addEventListener("DOMContentLoaded", function () {
  const clickableElements = document.querySelectorAll(".clickable-zone");

  clickableElements.forEach(function (element) {
    element.addEventListener("click", function () {
      const fillColor = element.getAttribute("fill");
      const zoneId = element.getAttribute("data-zone-id");

      console.log("Code hexadécimal de la couleur :", fillColor);
      console.log("ID de la zone :", zoneId);

      document.getElementById("zone-id-input").value = zoneId;

      showModal(zoneId);
    });
  });
});

function openModal() {
  document.getElementById('custom-modal').style.display = 'block';
}

function closeModal() {
  document.getElementById('custom-modal').style.display = 'none';
}

function submitForm() {
  const shotsMade = document.getElementById('shots-made').value;
  const shotsMissed = document.getElementById('shots-missed').value;
  const zoneId = document.getElementById("zone-id-input").value;


  closeModal();
}

function showModal(zoneId) {
  // Update the zone_id in the modal
  document.getElementById('zone-id-input').value = zoneId;

  // You can customize this function based on the zoneId
  let zoneInfo = "";

  // Example: Display different information for different zones
  switch (zoneId) {
    case "1":
      zoneInfo = "You clicked Zone 1. Display specific information for Zone 1.";
      break;
    case "2":
      zoneInfo = "You clicked Zone 2. Display specific information for Zone 2.";
      break;
    // Add more cases for other zones if needed
    default:
      zoneInfo = "You clicked an unknown zone. Display generic information.";
  }

  // Display the information in the modal
  document.getElementById('custom-modal-content').innerHTML = zoneInfo;

  // Open the modal
  openModal();
}
