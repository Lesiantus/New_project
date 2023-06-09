class TableSorter {
  constructor() {
    this.control = document.querySelector('.sort-by-title');
    if (this.control) {
      this.control.addEventListener('click', this.sortRowsByTitle.bind(this) );
    }
  }

  sortRowsByTitle() {
    const table = document.querySelector('tbody');
    const rows = table.querySelectorAll('tr');
    const sortedRows = [];
    const arrowUp = this.control.querySelector('.octicon-arrow-up').classList;
    const arrowDown = this.control.querySelector('.octicon-arrow-down').classList;
    for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i]);
    }
      if (arrowUp.contains('hide')) {
        sortedRows.sort(this.compareRowsAsc);
        arrowUp.remove('hide');
        arrowDown.add('hide');
      }
      else {
        sortedRows.sort(this.compareRowsDesc);
        arrowUp.add('hide');
        arrowDown.remove('hide');
      }
      const sortedTable = document.createElement('tbody');
      sortedTable.classList.add('tbody');
      sortedTable.appendChild(rows[0]);
      for (let i = 0; i < sortedRows.length; i++) {
        sortedTable.appendChild(sortedRows[i]);
      }
      table.parentNode.replaceChild(sortedTable, table);
    }

  compareRowsAsc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent;
    const testTitle2 = row2.querySelector('td').textContent;
    if (testTitle1 < testTitle2) { return -1; }
    if (testTitle1 > testTitle2) { return 1; }
    return 0;
  }

  compareRowsDesc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent;
    const testTitle2 = row2.querySelector('td').textContent;
    if (testTitle1 < testTitle2) { return 1; }
    if (testTitle1 > testTitle2) { return -1; }
    return 0;
  }
}

document.addEventListener('turbolinks:load', function() {
  new TableSorter();
});
