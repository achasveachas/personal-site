function calculate() {
    var errorMessage = invalidInputs();
    if(errorMessage){
        document.getElementById('result').innerHTML = errorMessage
        return
    }
}

function invalidInputs() {
    var inputs = document.getElementsByTagName('input');
    var errors = [];
    for (var i = 0; i < inputs.length; i++) {
        if (parseInt(inputs[i].value) >= parseInt(inputs[i].dataset["x"])) {
            errors.push(inputs[i].dataset["x"]);
        }
    }
    if (errors.length > 0) {   
        return "The values for the following fields seem off: " + errors.join(", ") + ".<br>Please check your math."
    }
}