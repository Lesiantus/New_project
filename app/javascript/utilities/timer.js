class TestTimer {
  constructor(element) {
    this.element = element;
    this.limitInSeconds = parseInt(element.dataset.timeLimit);
    this.timerId = null;
    this.initialize();
  }

  initialize() {
    this.showRemainingTime();
    this.timerId = setInterval(() => this.updateTimer(), 1000);
  }

  updateTimer() {
    this.limitInSeconds--;
    this.showRemainingTime();

    if (this.limitInSeconds === 0) {
      this.stopTimer();
      alert("Time is over");
      window.location.replace(window.location + '/result');
    }
  }

  showRemainingTime() {
    const minutes = parseInt(this.limitInSeconds / 60);
    const seconds = this.limitInSeconds % 60;
    this.element.textContent = `${minutes}:${seconds} до окончания времени на прохождение`;
  }

  stopTimer() {
    clearInterval(this.timerId);
  }
}

document.addEventListener('turbolinks:load', function() {
  const testTimerElement = document.querySelector(".test-timer");

  if (testTimerElement) {
    new TestTimer(testTimerElement);
  }
});
