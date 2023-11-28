function startAnimation() {
  // Masquer le bouton et le texte
  document.getElementById('startButton').style.visibility = 'hidden';
  document.getElementById('startText').style.visibility = 'hidden';

  // Commencer l'animation
  const basketballContainer = document.getElementById('basketball-container');
  basketballContainer.classList.add('animate'); // Ajouter une classe CSS pour l'animation

  // Rediriger après l'animation
  setTimeout(function() {
    // Changer l'URL de la page ici
    window.location.href = '/trainings/new';
  }, 200); // 200 millisecondes, ajustez selon vos besoins
}
