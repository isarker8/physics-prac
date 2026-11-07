#let l_r(xs, ys) = {
  let n = xs.len()

  let sx = xs.sum()
  let sy = ys.sum()
  let sxy = xs.zip(ys).map(((x, y)) => x * y).sum()
  let sx2 = xs.map(x => x * x).sum()

  let m = (n * sxy - sx * sy) / (n * sx2 - sx * sx)
  let c = (sy - m * sx) / n

  (m, c)
}

