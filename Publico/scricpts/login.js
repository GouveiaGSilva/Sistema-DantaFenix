const lEmail = document.getElementById("emailError");
const lSenha = document.getElementById("senhaError");
const iEmail = document.getElementById("inputEmail");
const iSenha = document.getElementById("inputPassword");
const form = document.getElementById('loginForm');

form.onsubmit = function(event) {

  if (form.checkValidity()) {
    console.log("Campos Preenchidos");
  }
  else{
    form.classList.add('was-validated');
    event.preventDefault();
    event.stopPropagation();  
  }
};
