document.getElementById("nameError").style.display = "none";
document.getElementById("telError").style.display = "none";
document.getElementById("emailError").style.display = "none";

function validateName() {
  var x = document.getElementById("name").value;
  if (x == "") {
    return false;
  }else if(!x.match(/^[a-zA-Z]+$/)){
    document.getElementById("nameError").style.display = "block";
  }else{
    document.getElementById("nameError").style.display = "none";
  }
}

function validateTel() {
  var x = document.getElementById("tel").value;
  if (x == "") {
    return false;
  }else if(!x.match(/^\d{3}-\d{3}-\d{4}$/)){
    document.getElementById("telError").style.display = "block";
  }else{
    document.getElementById("telError").style.display = "none";
  }
}

function validateMail() {
  var x = document.getElementById("email").value;
  if (x == "") {
    return false;
  }else if(!x.match(/^([\w\.]+)@([\w\.]+)\.(\w+)$/)){
    document.getElementById("emailError").style.display = "block";
  }else{
    document.getElementById("emailError").style.display = "none";
  }
}

function validateComment(){
  var x = document.getElementById("comment").value;
  if (x == "") {
    alert("Comment must be filled out");
    return false;
  }
}
