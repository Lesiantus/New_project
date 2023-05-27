document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.check-pass');

  if (control) { control.addEventListener('input', passwordCheck) }
});

function passwordCheck() {
  var password = document.getElementById('user_password');
  var confirmation = document.getElementById('user_password_confirmation');
  var match = document.querySelector('.octicon-check-circle-fill').classList;
  var notMatch = document.querySelector('.octicon-x-circle-fill').classList;


  if (confirmation.value == '') {
    match.add('hide');
    notMatch.add('hide');
  }
  else if (confirmation.value == password.value) {
    match.remove('hide');
    notMatch.add('hide');
  }
  else {
    match.add('hide');
    notMatch.remove('hide');
  }
}
