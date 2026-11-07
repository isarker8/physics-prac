#let project(body) = {
  // Page Setup
  set page(
    paper: "a4",
    margin: (x: 1.75in, y: 1.75in),
    numbering: "1",
    number-align: center,
  )
  counter(page).update(0)

  // Typography
  set text(font: "New Computer Modern", size: 12pt)
  set par(leading: 0.65em, spacing: 0.65em, first-line-indent: 1.8em, justify: true)
  
  // Headings
  set heading(numbering: "1.")
  show heading: set block(above: 1.4em, below: 0.8em)
  show heading: it => pad(left: -2em, it)
  
  // Lists
  set enum(spacing: 0.65em, indent: 1em, body-indent: 0.5em)
  set list(spacing: 0.65em, indent: 1em, body-indent: 0.5em)
  
  // Code and Maths
  show raw: set text(font: "New Computer Modern Mono")
  show math.equation: set text(weight: "regular")
  
  // Tables
  
    // 1. Bold the headers (Your approach - perfect)
  show table.cell.where(y: 0): it => strong(it)
  
  // 2. Set the Top and Header lines
  set table(
    stroke: (x, y) => {
      if y == 0 { (top: 0.8pt, bottom: 0.8pt) }
      else { none }
    },
    align: center,
  )
  
  // 3. Add the final Bottom line
  // We wrap the table in a block to add a border only to the very bottom
  show table: it => {
    block(stroke: (bottom: 0.8pt), it)
  }
  body
}

#let title-page(title: "", author: "", date: none) = {
  set page(numbering: none)
    // Title Page Construction
  align(center + horizon)[
    #block(text(size: 24pt, weight: "bold")[#title])
    #v(1.5em)
    #text(size: 14pt)[#author]
    #v(1em)
    #text(size: 12pt)[#date]
    #v(2em)
  ]
  pagebreak()
}
