#import "lilaq-config.typ": *
#import "linear-regression.typ": l_r
#import "data-table.typ": data-table
#import "@preview/zero:0.7.1": quan
#import "@preview/lilaq:0.6.0" as lq
#let (L, invL, P) = json("data-boyles.json")
#let data = json("data-boyles.json")

#show: lq.set-diagram(
  xlim: (0,auto),
  ylim: (0, auto),
  xaxis: (mirror: (ticks: false)),
  yaxis: (mirror: (ticks: false)),
)

#let boyles-law = [
  
  = Practical 1: Boyle's Law
  
  == Aim
  To Investigate Boyle's Law
  
  == Introduction
  Given measuring the cross sectional area of the tube is rather difficult; the area stays constant throughout, therefore the length of the fluid in the tube is proportional to the volume of the fluid in the capillary tube.
  $ therefore L prop V $
  
  == Variables
  - *Independent:* Volume (Length) 
  - *Dependent:* Pressure
  - *Control:* Mass, Temperature
  
  == Method
  + Set up the apparatus shown in the diagram, ensuring the tube is empty
  + Drawing in air each time to the tube (slowly), record the height ($L_n$ /#quan[cm]), until the total volume of the tube is filled up
  + Repeat the experiment removing the water in the tube and record the mean volume for each mass ($overline(L_n)$ /#quan[cm])
  + Plot a graph of $P$ /#quan[Pa] (y-axis) against $1/L$ /#quan[/cm] (x-axis), drawing a best-fit line, and deduce from the straight line through the origin that $P #sym.prop 1/L$.
  
  == Risk Assessment
  
  #table(
    columns: 3,
    table.header[
      Risk
    ][
      Hazard
    ][
      Mitigation(s)
    ],
  )
  
  == Results
  
  #let (m, c) = l_r(invL, P)
  
  #figure(
    stack(
      dir: ttb,
      spacing: 2em,
  
      align(center + horizon)[
        #data-table(
          data,
          columns: (
            (key: "L", header: [$L$ / #quan[cm]]),
            (key: "invL", header: [$1/L$ / #quan[/cm]]),
            (key: "P", header: [$P dot.op 10^5$ / #quan[Pa]]),
          ),
          precision: (
            L: 1,
            invL: 4,
            P: 2,
          ),
        )
      ],
  
      lq.diagram(
        xaxis: (exponent: -2),
        xlabel: [$1/L$ /#quan[/cm]],
        ylabel: [$P dot.op 10^5$ /#quan[Pa]],
  
        lq.scatter(invL, P),
  
        lq.plot(
          lq.linspace(calc.min(..invL), calc.max(..invL)),
          x => m * x + c,
          mark: none,
          stroke: red,
        )
      ),
    )
  )
  
  == Analysis
  #align(center)[
    $ P = #calc.round(m, digits: 3) (1/L)
    + #calc.round(c, digits: 3) $
  ]

  == Uncertainties
  It was rather difficult to get the pump to pump air into the capillary tube, which could allude to systematic errors.
  == Evaluation
  The constant in the equation #calc.round(c, digits: 3) is relatively small, which reflects random error and shows that the experimental data is relatively accurate
]
