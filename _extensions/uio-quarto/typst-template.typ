// UiO-inspirert oppgavemal med norsk navngiving for malens egne felt.
// Quarto-feltene title, subtitle, author, date og lang beholdes.
// Quarto-feltet author beholdes; verdiene normaliseres til Typsts navneformat.

#let uio-paper(
  body,

  // quartos innebygde verdier, som jeg uansett må ha med videre
  title: [],
  subtitle: none,
  author: (),
  date: none,
  lang: "nb",
  toc: false,
  toc_title: [],
  section_numbering: none,

  // variabler til malen
  forside: true, // legger til forsiden
  oppgave: [], // legger til en boks med oppgavetype på forsiden

  // legger til informasjon om oppgaven
  emne: none,
  institutt: none,
  fakultet: none,
  ordantall: none,
) = {
  set document(
    title: title,
    author: author.map(author_entry => content-to-string(author_entry.name)),
  )
  set page(
    paper: "a4",
    footer: context {
      let sidetall = counter(page).get().first()
      if not forside or sidetall != 0 {
        align(right)[
          #text(font: "Nimbus Sans", size: 8pt, fill: luma(95))[
            #counter(page).display("1")
          ]
        ]
      }
    },
  )
  set text(
    font: "Nimbus Sans",
    size: 11pt,
    fill: rgb("#202124"),
    lang: lang,
  )
  set par(justify: true, leading: 0.72em)
  show link: set text(fill: rgb("#3f454b"))

  set heading(numbering: section_numbering)

  show heading.where(level: 1): set text(
    font: "Nimbus Sans",
    size: 17pt,
    weight: "regular",
    fill: rgb("#202124"),
  )
  show heading.where(level: 2): set text(
    font: "Nimbus Sans",
    size: 13pt,
    weight: "semibold",
    fill: rgb("#30343a"),
  )
  show heading.where(level: 3): set text(
    font: "Nimbus Sans",
    size: 11pt,
    weight: "semibold",
  )

  // Mål for forsiden
  let forside_venstre = 10mm
  let forside_høyre = 10mm
  let forside_topp = 10mm
  let forside_bunn = 10mm
  let logo_høyde = 15mm
  let oppgavefelt_topp = 66mm
  let oppgave_innrykk = 3mm
  let toppfelt_høyde = 90mm
  let tittel_topp = 100mm
  let oppgave_skiftstørrelse = 14pt
  let tittel_størrelse = 32pt
  let detalj_størrelse = 14pt
  let segl_størrelse = 40mm

  if forside {
    set page(margin: (
      left: forside_venstre,
      right: forside_høyre,
      top: forside_topp,
      bottom: forside_bunn,
    ))

    // Grått toppfelt med utfallende kanter.
    place(top + left, dx: -forside_venstre, dy: -forside_topp)[
      #rect(width: 210mm, height: toppfelt_høyde, fill: rgb("#b3b3b3"))
    ]

    // Velg UiOs offisielle logo etter Quarto-feltet lang.
    let logo = if lang.starts-with("en") {
      "uio-fp-navn-eng.pdf"
    } else if lang.starts-with("nn") {
      "uio-fp-navn-nn.png"
    } else {
      "uio-fp-navn-bm.png"
    }
    place(top + left, dx: 0mm, dy: 0mm)[
      #image(logo, height: logo_høyde)
    ]
    place(top + left, dx: 0mm, dy: oppgavefelt_topp - forside_topp)[
      #box(
        fill: rgb("#202124"),
        inset: oppgave_innrykk,
      )[
        #text(
          font: "Nimbus Sans",
          size: oppgave_skiftstørrelse,
          fill: white,
        )[#oppgave]
      ]
    ]

    // Tittel og opplysninger står på samme venstrekant som logoen.
    v(tittel_topp - forside_topp)
    block(inset: (left: 0mm, right: 0mm))[
      #set par(leading: 38pt)
      #set par(justify: false)
      #set text(hyphenate: false)
      #text(
        font: "Nimbus Sans",
        size: tittel_størrelse,
        weight: "regular",
      )[#title]

      #set par(leading: 18pt)
      #if subtitle != none [
        #v(6.35mm)
        #text(font: "Nimbus Sans", size: detalj_størrelse)[#subtitle]
      ]

      #v(10mm)
      #for author_entry in author [
        #text(font: "Nimbus Sans", size: detalj_størrelse, weight: "bold")[
          #author_entry.name
        ]
        #linebreak()
      ]

      #v(5mm)
      #if emne != none [
        #text(font: "Nimbus Sans", size: detalj_størrelse)[#emne]
        #linebreak()
      ]
      #if institutt != none [
        #v(5mm)
        #text(font: "Nimbus Sans", size: detalj_størrelse)[#institutt]
        #linebreak()
      ]
      #if fakultet != none [
        #v(5mm)
        #text(font: "Nimbus Sans", size: detalj_størrelse)[#fakultet]
      ]
      #if ordantall != none [
        #v(5mm)
        #text(font: "Nimbus Sans", size: detalj_størrelse)[#ordantall]
      ]
    ]

    place(bottom + right, dx: 0mm, dy: 0mm)[
      #image("uio-fp-segl.pdf", width: segl_størrelse)
    ]
    if date != none {
      place(bottom + left, dx: 0mm, dy: 0mm)[
        #text(font: "Nimbus Sans", size: detalj_størrelse)[#date]
      ]
    }

    // Forsiden nummereres ikke; første side med oppgavetekst blir side 1.
    counter(page).update(0)
    pagebreak()
  }

  if toc {
    outline(title: toc_title, depth: 3)
    v(4mm)
  }

  body
}
