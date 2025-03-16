#let ang(x) = $lr(angle.l #x angle.r)$

#let strings-italic = (d) => {
  show math.equation: (e) => {
    show text: math.italic
    e
  }
  d
}
