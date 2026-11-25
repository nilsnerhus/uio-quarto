// Grey UiO-inspired paper format.
// Layout follows the bachelor/master cover grid: grey header, degree label,
// title and author details, with the university seal at the lower right.

#let uio-paper(
  doc,
  title: [Untitled],
  subtitle: none,
  authors: (),
  document_type: [Fagartikkel],
  date: none,
  program: none,
  department: none,
  faculty: none,
  cover: true,
  abstract: none,
  abstract_title: [Sammendrag],
  lang: "nb",
  mainfont: "Libertinus Serif",
  fontsize: 11pt,
  papersize: "a4",
  margin: (x: 25mm, y: 24mm),
  toc: false,
  toc_title: [Innhold],
  toc_depth: 3,
  section_numbering: none,
) = {
  set document(
    title: title,
    author: authors.map(author => content-to-string(author.name)),
  )
  set page(
    paper: papersize,
    margin: margin,
    numbering: "1",
    footer: context {
      let page-number = counter(page).get().first()
      if not cover or page-number != 0 {
        align(right)[
          #text(font: "Nimbus Sans", size: 8pt, fill: luma(95))[
            #counter(page).display("1")
          ]
        ]
      }
    },
  )
  set text(font: mainfont, size: fontsize, fill: rgb("#202124"), lang: lang)
  set par(justify: true, leading: 0.72em)
  show link: set text(fill: rgb("#3f454b"))

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

  if section_numbering != none {
    set heading(numbering: section_numbering)
  }

  // Shared page-relative geometry transcribed from uiomasterfp.sty.
  let cover_left = 9.88mm
  let cover_right = 9.88mm
  let cover_top = 7.7mm
  let cover_bottom = 9.88mm
  let cover_band_height = 92.7mm
  let cover_badge_top = 65.4mm
  let cover_title_top = 100.1mm
  let cover_wordmark_height = 12.8mm
  let cover_badge_font_size = 14pt
  let cover_badge_padding = 3mm
  let cover_title_size = 32pt
  let cover_body_size = 14pt
  let cover_seal_size = 23.7mm

  if cover {
    // Use the official front-cover grid; regular document margins resume
    // after this conditional block.
    set page(margin: (
      left: cover_left,
      right: cover_right,
      top: cover_top,
      bottom: cover_bottom,
    ))

    // The band is full-bleed. The rest of the page stays white.
    place(top + left, dx: -cover_left, dy: -cover_top)[
      #rect(width: 210mm, height: cover_band_height, fill: rgb("#b3b3b3"))
    ]

    // Use UiO's official language-specific front-page wordmark.
    let wordmark = if lang.starts-with("en") {
      "uio-fp-navn-eng.pdf"
    } else if lang.starts-with("nn") {
      "uio-fp-navn-nn.png"
    } else {
      "uio-fp-navn-bm.png"
    }
    place(top + left, dx: 0mm, dy: 0mm)[
      #image(wordmark, height: cover_wordmark_height)
    ]
    place(top + left, dx: 0mm, dy: cover_badge_top - cover_top)[
      #box(
        fill: rgb("#202124"),
        inset: cover_badge_padding,
      )[
        #text(font: "Nimbus Sans", size: cover_badge_font_size, fill: white)[#document_type]
      ]
    ]

    // Place the title and details at the same left edge as the wordmark.
    v(cover_title_top - cover_top)
    block(inset: (left: 0mm, right: 0mm))[
      #set par(leading: 38pt)
      #set par(justify: false)
      #set text(hyphenate: false)
      #text(
        font: "Nimbus Sans",
        size: cover_title_size,
        weight: "regular",
      )[#title]

      #set par(leading: 18pt)
      #if subtitle != none [
        #v(6.35mm)
        #text(font: "Nimbus Sans", size: cover_body_size)[#subtitle]
      ]

      #v(19mm)
      #for author in authors [
        #text(font: "Nimbus Sans", size: cover_body_size, weight: "bold")[#author.name]
        #linebreak()
      ]

      #v(6.35mm)
      #if program != none [
        #text(font: "Nimbus Sans", size: cover_body_size)[#program]
        #linebreak()
      ]
      #v(6.35mm)
      #if department != none [
        #text(font: "Nimbus Sans", size: cover_body_size)[#department]
        #linebreak()
      ]
      #if faculty != none [
        #text(font: "Nimbus Sans", size: cover_body_size)[#faculty]
      ]
    ]

    place(bottom + right, dx: 0mm, dy: 0mm)[
      #image("uio-fp-segl.pdf", width: cover_seal_size)
    ]
    if date != none {
      place(bottom + left, dx: 0mm, dy: 0mm)[
        #text(font: "Nimbus Sans", size: cover_body_size)[#date]
      ]
    }

    // Reset numbering so the first page of the paper is page 1.
    counter(page).update(0)
    pagebreak()
  }

  if abstract != none {
    heading(level: 1, outlined: false)[#abstract_title]
    abstract
    v(4mm)
  }

  if toc {
    outline(title: toc_title, depth: toc_depth)
  }

  doc
}
