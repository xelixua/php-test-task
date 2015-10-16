var loginInput = document.getElementsByName("login")[0],
    passwordInput = document.getElementsByName("password")[0],
    newUserButton = document.getElementById("newUser"),
    langselect = document.getElementById("langselect"),
    DEFAULT_VALUES,
    
    appendLocalization = function(){
      var   interfaceLanguage = document.getElementById("iterfaceLanguage"),
            loginInput = document.getElementsByName("login")[0],
            erroredLogin = document.getElementById("erroredLogin"),
            passwordInput = document.getElementsByName("password")[0],
            erroredPassword = document.getElementById("erroredPassword"),
            emailInput = document.getElementsByName("email")[0],
            erroredEmail = document.getElementById("erroredEmail"),
            photoInvite = document.getElementById("photoInvite"),
            submitButton = document.getElementById("submitButton"),
            newUser = document.getElementById("newUser");
            
        interfaceLanguage.innerHTML = DEFAULT_VALUES.interfaceLanguage;
        loginInput.setAttribute("value", DEFAULT_VALUES.login);
        erroredLogin.innerHTML = DEFAULT_VALUES.wrongLogin;
        passwordInput.setAttribute("value", DEFAULT_VALUES.password);
        erroredPassword.innerHTML = DEFAULT_VALUES.wrongPassword;
        emailInput.setAttribute("value", DEFAULT_VALUES.email);
        erroredEmail.innerHTML = DEFAULT_VALUES.wrongEmail;
        photoInvite.innerHTML = DEFAULT_VALUES.selectPhoto;
        submitButton.setAttribute("value", DEFAULT_VALUES.signin);
        newUser.setAttribute("value", DEFAULT_VALUES.register);
    },
    
    getLocalization = function(lang){
        var req = new XMLHttpRequest(),
            name = "localizations/localization_" + lang + ".json";
        req.open("GET", name, false);
        req.onreadystatechange = function(){
            if (this.readyState === 4){
                DEFAULT_VALUES = JSON.parse(req.responseText);
                appendLocalization();
            }
        };
        req.send();
    },
                
    newLocalizationSelected = function(){
        var lang = document.getElementsByName("lang")[0];
        switch(langselect.value){
            case "русский": {
                lang.setAttribute("value","ru");
                getLocalization("ru"); 
                break;
                
            }
            case "english": {
                lang.setAttribute("value","en");
                getLocalization("en");
                break;
            }
            default: getLocalization("ru");
        }
    },
    
    inputGotFocus = function(event){
        var input = event.target,
            oldValue = input.value;
        
        input.value = (oldValue === DEFAULT_VALUES[input.getAttribute("name")]  ? "" : oldValue);
    },
    
    inputLostFocus = function(event){
        var input = event.target,
            newValue = input.value;

        newValue === "" ? input.value = DEFAULT_VALUES[input.getAttribute("name")] : newValue;
        },
    
    validateLoginData = function(){
        var probabaleLogin = document.getElementsByName("login")[0].value,
            probabalePassword = document.getElementsByName("password")[0].value,
            probableEmail = document.getElementsByName("email")[0].value,
            loginRegexp = /^[0-9a-zA-Z-_.]+$/;
            passwordRegexp = /^[0-9a-zA-Z-_.!@#$%^&*()+=;:,./?\\|`~[\]{}.]+$/,
            emailRegexp = /^[0-9a-zA-Z-_.]+@[0-9a-zA-Z-_.]+[.][a-zA-Z]{3}?$/
            loginError = document.getElementById("erroredLogin"),
            passwordError = document.getElementById("erroredPassword"),
            emailError = document.getElementById("erroredEmail"),
            isCorrect = true;
            
        //login verification
        if(loginRegexp.test(probabaleLogin)){
            erroredLogin.setAttribute("style", "display:block");
            isCorrect = false;
        } else {
            erroredLogin.setAttribute("style", "display:none");
        }
        if(passwordRegexp.test(probabalePassword)){
            erroredPassword.setAttribute("style", "display:block");
            isCorrect = false;
        } else {
            erroredPassword.setAttribute("style", "display:none");
        }
        if(emailRegexp.test(probableEmail)){
            erroredEmail.setAttribute("style", "display:block");
            isCorrect = false;
        } else {
            erroredEmail.setAttribute("style", "display:none");
        }
        
        return isCorrect;
    },
    
    newUserButtonClicked = function(event){
        var newUser = event.target,
            submit = document.getElementById("submitButton"),
            photoUpload = document.getElementsByName("uploadPhoto")[0],
            emailInput = document.getElementsByName("email")[0],
            dataType = document.getElementsByName("dataType")[0],
            photoInvite = document.getElementById("photoInvite"),
            filePath = document.getElementsByName("userfile")[0];
            
        emailInput.setAttribute("style", "display:block");
        photoInvite.setAttribute("style", "display:block");
        filePath.setAttribute("style", "display:block");
        newUser.setAttribute("style", "display:none");
        emailInput.onclick = inputGotFocus;
        emailInput.onblur = inputLostFocus;
        submit.setAttribute("value", DEFAULT_VALUES.newUser);
        dataType.setAttribute("value", "register");
    };

getLocalization("ru");
langselect.onchange = newLocalizationSelected;
loginInput.onclick = inputGotFocus;
loginInput.onblur = inputLostFocus;
passwordInput.onclick = inputGotFocus;
passwordInput.onblur = inputLostFocus;
newUserButton.onclick = newUserButtonClicked;