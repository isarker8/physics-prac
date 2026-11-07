#let format-number(value, digits) = {
  let factor = calc.pow(10, digits)
  let scaled = int(calc.round(calc.abs(value) * factor))
  let raw = str(scaled)

  let padded = if raw.len() <= digits {
    "0" * (digits + 1 - raw.len()) + raw
  } else {
    raw
  }

  let split = padded.len() - digits

  if digits == 0 {
    (if value < 0 { "-" } else { "" }) + padded
  } else {
    let sign = if value < 0 { "-" } else { "" }
    let integer = padded.slice(0, split)
    let decimal = padded.slice(split)

    sign + integer + "." + decimal
  }
}

#let data-table(data, columns: (), precision: ()) = {
  let headers = columns.map(c => c.header)

  let rows = range(data.at(columns.first().key).len()).map(i => {
    columns.map(c => {
      let value = data.at(c.key).at(i)
      let digits = precision.at(c.key, default: none)

      if digits == none {
        str(value)
      } else {
        format-number(value, digits)
      }
    })
  })

  table(
    columns: columns.len(),
    table.header(..headers),
    ..rows.flatten(),
  )
}
