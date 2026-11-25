#show: uio-paper.with(
  // Quarto-standardfeltene beholdes med de opprinnelige navnene.
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(author)$
  author: (
$for(author)$
$if(author.name)$
    (name: [$author.name.literal$]),
$else$
    (name: [$author$]),
$endif$
$endfor$
  ),
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(toc)$
  toc: true,
$else$
  toc: false,
$endif$
$if(toc-title)$
  toc_title: [$toc-title$],
$endif$
$if(section-numbering)$
  section_numbering: "$section-numbering$",
$endif$

  // Egendefinerte felt for UiO-oppgavemalen.
$if(oppgave)$
  oppgave: [$oppgave$],
$endif$
$if(emne)$
  emne: [$emne$],
$endif$
$if(institutt)$
  institutt: [$institutt$],
$endif$
$if(fakultet)$
  fakultet: [$fakultet$],
$endif$
$if(ordantall)$
  ordantall: [$ordantall$],
$endif$

$if(forside)$
  forside: true,
$else$
  forside: false,
$endif$
)
