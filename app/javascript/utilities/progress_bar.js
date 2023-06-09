class ProgressBar {
    constructor(){
        this.elem = document.querySelector('.progress-bar');
        if(this.elem) {
            this.width = this.elem.dataset.barWidth;
            this.elem.style.width = this.width + '%';
        }
    }
}
document.addEventListener('turbolinks:load', function() {
  new ProgressBar();
});
