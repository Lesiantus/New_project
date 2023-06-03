document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by-title')

  if (control) {control.addEventListener('click', sortRowsByTitle)}
})

function sortRowsByTitle() {
  const table = document.querySelector('tbody')

  // NodeList
  // https://developer.mozilla.org/ru/docs/Web/API/NodeList

  const rows = table.querySelectorAll('tr')
  const sortedRows = []
  const arrowUp = this.querySelector('.octicon-arrow-up').classList
  const arrowDown = this.querySelector('.octicon-arrow-down').classList

  // select all atable rows except the first one which is header
  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if(arrowUp.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    arrowUp.remove('hide')
    arrowDown.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    arrowUp.add('hide')
    arrowDown.remove('hide')
  }

  const sortedTable = document.createElement('tbody')

  sortedTable.classList.add('tbody')
  sortedTable.appendChild(rows[0])

  for (let i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
