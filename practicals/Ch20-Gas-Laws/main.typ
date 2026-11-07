#import "general-config.typ": *
#import "lilaq-config.typ": *
#import "linear-regression.typ": l_r

#import "boyles-law.typ": boyles-law
#import "charles-law.typ": charles-law

#set document(
  title: "Gas Laws Practicals",
  author: "Ibrahim",
)

#show: project
#show: lilaq-config

#title-page(
  title: [Gas Laws Practicals],
  author: [Ibrahim],
  date: [28/09/2026]
)

#boyles-law
#pagebreak()
#charles-law

= References
#show link: it => underline(text(fill: blue, it))
#link(
  "https://pmt.physicsandmathstutor.com/download/Physics/A-level/Notes/AQA/Practical-Skills/RP%2008%20-%20Boyle's%20and%20Charles's%20Laws.pdf",
)[
  Boyle's and Charles' Laws
]
#text(
  "Accessed: 25/09/2026 @ 18:58",
  style: "italic",
  weight: "extralight"
)
