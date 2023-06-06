document.getElementById("sub").onclick= function(){
    if (document.getElementById("name").textContent==""){
               document.getElementById("name").style.borderBlockColor="red"
               document.getElementById("name-error-content").style.visibility="visible"
}
if (document.getElementById("email").textContent==""){
    document.getElementById("email").style.borderBlockColor="red"
    document.getElementById("email-error-content").style.visibility="visible"
}
if (document.getElementById("password").textContent==""){
    document.getElementById("password").style.borderBlockColor="red"
    document.getElementById("password-error-content").style.visibility="visible"
}
}