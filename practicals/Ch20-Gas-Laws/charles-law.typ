#import "lilaq-config.typ": *
#import "linear-regression.typ": l_r
#import "data-table.typ": data-table
#import "@preview/zero:0.7.1": quan, zi
#import "@preview/lilaq:0.6.0" as lq
#let (T, L) = json("data-charles.json")
#let data = json("data-charles.json")

#show: lq.set-diagram(
  xlim: (0,auto),
  ylim: (0, auto),
  xaxis: (mirror: (ticks: false)),
  yaxis: (mirror: (ticks: false)),
)

#let charles-law = [
  
  = Practical 2: Charles' Law
  
  == Aim
  To Investigate Charles' Law
  
  == Introduction
  Given measuring the cross sectional area of the tube is rather difficult; the area stays constant throughout, therefore the length of the fluid in the tube is proportional to the volume of the fluid in the capillary tube.
  $ therefore L prop V $
  
  == Variables
  - *Independent:* Temperature 
  - *Dependent:* Length (Volume)
  - *Control:* Mass, Pressure
  
  == Method
  + Set up the apparatus as shown in the diagram, ensuring the hot water in the beaker or measuring cylinder fully submerges the air sample.
  + Stir the water well using the thermometer, then read and record the initial temperature ($theta_i$ /#zi.degreeCelsius()) and the length of the air sample ($L$ /#quan[cm]).
  + add ice and stir well, taking measurements every #zi.degreeCelsius[5] down to room temperature.
  + plot a graph of $theta$ /#zi.degreeCelsius() (x-axis) against $L$ /#quan[cm] (y-axis), drawing a best-fit line.
  + deduce the point of absolute zero, $theta_0$, from the graph by extrapolating the line to the x-intercept (where $L = 0$).
  
  == Risk Assessment
  
  #table(
    columns: 3,
    table.header[
      Hazard
    ][
      Risk
    ][
      Mitigation(s)
    ],
    [Boiling water], [Spills and Burns skin], [Handle boiling water with care, taking caution not to cause any spills.],
  )
  
  == Results
  
  #let (m, c) = l_r(T, L)
  
  #figure(
    stack(
      dir: ttb,
      spacing: 2em,
  
      align(center + horizon)[
        #data-table(
          data,
          columns: (
            (key: "T", header: [$theta$ /#zi.degreeCelsius()]),
            (key: "L", header: [$L$ /#quan[cm]]),
          ),
          precision: (
            T: 1,
            L: 1,
        ),
      )
    ],
  
      lq.diagram(
        xlabel: [$theta$ /#zi.degreeCelsius()],
        ylabel: [$L$ /#quan[cm]],
  
        lq.scatter(T, L),
  
        lq.plot(
          lq.linspace(calc.min(..T), calc.max(..T)),
          x => m * x + c,
          mark: none,
          stroke: red,
        )
      ),
      align(center)[
        $ L = #calc.round(m, digits: 3)theta
        + #calc.round(c, digits: 3) $
      ]
    )
  )
  
  == Analysis
  Setting $L = 0$ gives $theta_0 = #zi.degreeCelsius[-49.7]$, which is far from the true value of absolute zero temperature, since it is an extrapolation of data.
  Calculating a $Delta percent$age:

  #align(center)[
    $Delta percent 
    &= (-273+49.7)/(-273) times 100 \
    &= 81.8percent > 20 percent$
  ]
    $therefore$ results are not accurate.

  == Uncertainties
  == Evaluation
  Large errors, due to:
  + not being able to fully submerge the packet of air fully in the water 
  + steam from the water making it difficult to read off of the scales
]
