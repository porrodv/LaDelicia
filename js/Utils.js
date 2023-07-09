function onlyNumbers(event) {
  var key = event.keyCode || event.which;
  var keyChar = String.fromCharCode(key);
  var regex = /^[0-9]+$/;
  if (!regex.test(keyChar)) {
    event.preventDefault();
    return false;
  }
}

export { onlyNumbers };
