
class PasswordChecker {
  constructor() {
    this.control = document.querySelector('.check-pass');
    if (this.control) {
      this.password = document.getElementById('user_password');
      this.confirmation = this.control.querySelector('.form-control');
      this.match = this.control.querySelector('.octicon-check-circle-fill').classList;
      this.notMatch = this.control.querySelector('.octicon-x-circle-fill').classList;
      this.confirmation.addEventListener('input', this.checkPassword.bind(this));
    }
  }

  checkPassword() {
    if (this.confirmation.value == '') {
      this.hideElement(this.match);
      this.hideElement(this.notMatch);
    }
    else if (this.confirmation.value == this.password.value) {
      this.elementShow(this.match);
      this.elementHide(this.notMatch);
    }
    else {
      this.elementHide(this.match);
      this.elementShow(this.notMatch);
    }
  }

  elementHide(element) {
    element.add('hide');
  }
  elementShow(element) {
    element.remove('hide');
  }
}

document.addEventListener('turbolinks:load', function() {
  new PasswordChecker();
});
