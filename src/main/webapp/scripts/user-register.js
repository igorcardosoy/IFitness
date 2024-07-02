"use strict"

window.onload = initPage



function initPage() {
	let form
	
	form = document.getElementById("formRegister")
	form.noValidate = true
	form.onsubmit = (e) => {
		let valid = processValidity(form)
		if (!valid) {
			e.preventDefault()
		}
	}
}

function processValidity(form) {
    validatePassword(form)
    return applyValidity(form)
}

function applyValidity(form) {
	let errorCount = 0
	let elements = form.elements
	
	for (let i = 0; i < elements.length-1; i++) {
		let currentElement = elements[i];
		let span = document.getElementById("errorAlert-"+i)
		if (!currentElement.validity.valid) {
			span.innerHTML = currentElement.validationMessage
			errorCount++
        } else {
			span.innerHTML = ""
		}
	}
	
	return errorCount == 0;
}

function validatePassword(form) {
	let password = form.elements["password"]
	let passwordConfirm = form.elements["passwordConfirm"]
	
	password.value != passwordConfirm.value ? password.setCustomValidity("As senhas não coincidem") : password.setCustomValidity("")	
}