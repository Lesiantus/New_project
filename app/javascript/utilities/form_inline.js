class FormInline {
  constructor() {
    this.controls = document.querySelectorAll('.form-inline-link')
    if (this.controls.length) {
      for (let i = 0; i < this.controls.length; i++) {
        this.controls[i].addEventListener('click', (event) => this.formInLineLinkHandler(event))
      }
    }

    this.errors = document.querySelector('.resource-errors')
    if (this.errors) {
      const resourceId = this.errors.dataset.resourceId
      this.formInLineHandler(resourceId)
    }
  }

  formInLineLinkHandler(event) {
    event.preventDefault()
    const testId = event.target.dataset.testId
    this.formInLineHandler(testId)
  }

  formInLineHandler(testId) {
    const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
    const testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
    const formInLine = document.querySelector('.form-inline[data-test-id="' + testId + '"]')
    if (formInLine) {
      this.formOrTitle(formInLine, testTitle, link)
    }
  }

  formOrTitle(formInLine, testTitle, link) {
    if (formInLine.classList.contains('hide')) {
      testTitle.classList.add('hide');
      formInLine.classList.remove('hide');
      link.textContent = 'Cancel';
    }
    else {
      testTitle.classList.remove('hide');
      formInLine.classList.add('hide');
      link.textContent = 'Edit';
    }
  }
}

document.addEventListener('turbolinks:load', function() {
  new FormInline()
})
