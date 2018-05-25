function calculate() {
    var errorMessage = invalidInputs();

    if(errorMessage){
        document.getElementById('result').innerHTML = errorMessage;
        return
    }
    // Get the original values of x3, x5, and x7
    var x3 = parseInt(document.getElementById('x3').value);
    var x5 = parseInt(document.getElementById('x5').value);
    var x7 = parseInt(document.getElementById('x7').value);
    
    // Multiply the Xs by the appropriate numbers
    x3 *= 70;
    x5 *= 21;
    x7 *= 15;

    // Add them up and substract 105 until you get the number
    var total = x3 + x5 + x7;
    while (total >= 105) {
        total -= 105
    }

    document.getElementById('result').innerHTML = "Your number was: <strong>" + total + "</strong>"
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