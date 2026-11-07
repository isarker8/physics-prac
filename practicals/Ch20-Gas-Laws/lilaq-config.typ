#import "@preview/lilaq:0.6.0" as lq

#let lilaq-config(body) = {
  show: lq.set-diagram(
    xaxis: (mirror: (ticks: false)),
    yaxis: (mirror: (ticks: false)),
    xlim: (0, auto),
    ylim: (0, auto),
  )

  body
}
