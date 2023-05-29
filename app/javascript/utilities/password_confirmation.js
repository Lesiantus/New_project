document.addEventListener('turbolinks:load', function () {
  const control = document.querySelector('.check-pass');

    if (control)
      passwordCheck(control)
});

function passwordCheck(control) {
  const password = document.getElementById('user_password');
  const confirmation = control.querySelector('.form-control');
  const match = control.querySelector('.octicon-check-circle-fill').classList;
  const notMatch = control.querySelector('.octicon-x-circle-fill').classList;

  confirmation.addEventListener('input', function () {


    if (confirmation.value == '') {
      elementHide(match);
      elementHide(notMatch);
    }
    else if (confirmation.value == password.value) {
      elementShow(match);
      elementHide(notMatch);
    }
    else {
      elementHide(match);
      elementShow(notMatch);
    }
  })
}

function elementHide(element) {
  element.add('hide')
}

function elementShow(element) {
  element.remove('hide')
}
