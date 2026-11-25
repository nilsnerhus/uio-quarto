#show: uio-paper.with(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(author)$
  authors: (
$for(author)$
$if(author.name)$
    (name: [$author.name.literal$]),
$else$
    (name: [$author$]),
$endif$
$endfor$
  ),
$endif$
$if(document_type)$
  document_type: [$document_type$],
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(program)$
  program: [$program$],
$endif$
$if(department)$
  department: [$department$],
$endif$
$if(faculty)$
  faculty: [$faculty$],
$endif$
$if(abstract)$
  abstract: [$abstract$],
$endif$
$if(abstract-title)$
  abstract_title: [$abstract-title$],
$else$
  abstract_title: [Sammendrag],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(mainfont)$
  mainfont: "$mainfont$",
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$endif$
$if(papersize)$
  papersize: "$papersize$",
$endif$
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$endif$
$if(cover)$
  cover: $if(cover)$true$else$false$endif$,
$else$
  cover: false,
$endif$
$if(toc)$
  toc: true,
$endif$
$if(toc-title)$
  toc_title: [$toc-title$],
$endif$
$if(toc-depth)$
  toc_depth: $toc-depth$,
$endif$
$if(section-numbering)$
  section_numbering: "$section-numbering$",
$endif$
)
