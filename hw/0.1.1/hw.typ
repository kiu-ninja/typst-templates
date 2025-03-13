#import "@preview/ctheorems:1.1.3": *
#import "@preview/equate:0.2.1": equate
#import "@preview/codly:1.0.0": *

#let hw(body) = {
  set page(width: 18cm, height: 20cm, margin: 2cm, numbering: "1")
  set text(font: "DejaVu Sans Mono", hyphenate: true)
  set par(first-line-indent: 1em, spacing: 9pt)

  show: thmrules.with(qed-symbol: $square$)

  show enum: d => block(d, breakable: true)
  show list: d => block(d, breakable: true)

  show: equate.with(breakable: true, sub-numbering: true)
  set math.equation(numbering: "(1.1)")

  show math.equation: d => {
    show "?": q => box(
      stroke: (paint: red.transparentize(70%), dash: "dashed"),
      text(red, q),
      outset: 4pt,
      radius: 4pt,
    )
    d
  }
  
  codly(zebra-fill: none, number-align: right)

  body
}

#let theorem = thmbox(
  "theorem",
  "Theorem",
  inset: 1em,
  titlefmt: d => [*_#(d)_*],
  stroke: black,
)
#let proof = thmproof("theorem", "Proof")
#let lemma = thmbox(
  "theorem",
  "Lemma",
  titlefmt: d => [*_#(d)_*],
  stroke: gray
)
#let proposition = thmbox(
  "theorem",
  "Proposition",
  titlefmt: d => [*_#(d)_*],
  stroke: gray
)
#let definition = thmbox("theorem", "Definition", inset: (x: 1.2em, top: 1em))
#let remark = thmbox("theorem", "Remark", stroke: gray)
#let example = thmplain("theorem", "Example").with(numbering: none)
#let exercise = thmbox("theorem", "Exercise", stroke: gray).with(numbering: none)

#let blank = {
  h(2pt)
  box(hide[blank], stroke: gray.lighten(50%), fill: gray.lighten(80%), radius: 2pt, outset: 2pt)
  h(2pt)
}

#let problem(..args) = {
  let body = none;
  let title = none;
  let number = none;
  let args = args.pos();

  if args.len() >= 2 and type(args.at(0)) == int {
    number = args.remove(0);
  }
  if args.len() >= 2 and type(args.at(0)) == content {
    title = args.remove(0);
  }
  if args.len() >= 1 {
    body = args.remove(0);
  }

  context {
    if number == none {
      counter("problem").step(level: 1)
    } else {
      counter("problem").update((number,))
    }
  }

  v(1em)
  box(
    outset: (left: 10cm),
    inset: (y: 6pt, x: 8pt),
    radius: (bottom-right: 6pt),
    stroke: black + 1pt,
    text(fill: black, weight: "extrabold", size: 14pt)[
      #context { counter("problem").display("1.1") }
    ],
  )

  if title != none {
    box(
      inset: 6pt,
      text(fill: black, weight: "extrabold", size: 14pt, title),
    )
  }

  block(
    width: 100%,
    inset: (left: 2em),
    body,
  )
}

#let solution(body) = {
  text(fill: black, weight: "extrabold", size: 14pt)[
    Solution
  ]

  block(
    width: 100%,
    inset: (left: 2em),
    body,
  )
}

#let hint(body) = {
  block(
    width: 100%,
    inset: 1em,
    // radius: 6pt,
    // stroke: black,
    {    
      text(fill: black, weight: "extrabold")[
        Hint:
      ]
      body
    },
  )
}

#let note(title: "Note", body) = {
  block(
    stroke: blue,
    inset: 1em,
    radius: 1em,
    width: 100%
  )[
    #text(blue)[#title: ] #body
  ]
}

// #let circle(body) = {
//   box(stroke: black + 0.5pt, outset: (y: 4pt), inset: (x: 4pt), radius: 100%, body)
// }

// Math constants

#let rank = math.op("rank")
#let ext = math.op("ext")
#let pm = $plus.minus$
#let leftopen(a, b) = $lr(paren.l #a, #b bracket.r)$
#let rightopen(a, b) = $lr(brakcet.l #a, #b paren.r)$
