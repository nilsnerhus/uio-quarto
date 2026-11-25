# UiO Paper

A Quarto format extension for A4 papers and assignments, using Typst for PDF
output. The cover follows the official UiO master-front-page layout, with a
grey band over a white page, official language-specific wordmarks, and editable
cover details from YAML front matter.

## Install into an existing Quarto project

From the root of your project, run:

```sh
quarto add nilsnerhus/uio-paper
```

Use the format in an individual `.qmd` file:

```yaml
---
title: "A paper title"
subtitle: "Optional subtitle"
author: "Your Name"
document_type: "Semesteroppgave"
program: "Your study programme"
department: "Your department"
faculty: "Your faculty"
date: today
lang: nb
format:
  uio-paper-typst: default
---
```

Render it with:

```sh
quarto render paper.qmd
```

For a paper-only Quarto project, set the format once in `_quarto.yml`:

```yaml
format:
  uio-paper-typst: default
```

## Start from the example

To create a new project containing the extension and starter paper, run:

```sh
quarto use template nilsnerhus/uio-paper
```

The starter document is also available as [`template.qmd`](template.qmd).

## Front matter

| Field | Purpose | Default |
| --- | --- | --- |
| `title` | Main cover title | `Untitled` |
| `subtitle` | Optional subtitle | — |
| `author` | One author or a list of authors | — |
| `document_type` | Text in the dark cover label | `Fagartikkel` |
| `program` | Study programme or affiliation | — |
| `department` | Department or institute | — |
| `faculty` | Faculty | — |
| `date` | Date printed at the bottom of the cover | — |
| `cover` | Include the cover | `true` |
| `abstract` | Abstract before the document body | — |
| `toc` | Include a table of contents | `false` |

Set `cover: false` to use the interior styling without a cover. Normal Quarto
Typst features, including citations, cross-references, figures, and tables,
remain available.

The extension selects the official Bokmål, Nynorsk, or English wordmark from
the `lang` field. It uses Quarto's bundled Typst compiler; no separate Typst
installation is required.

## Design and assets

The cover measurements and typography are based on UiO's `uiomasterfp`
LaTeX package: A4 format, 9.88 mm side alignment, 7.7 mm wordmark top,
92.7 mm grey band, 65.4 mm badge top, 100.1 mm title start, and a 23.7 mm
seal. The area outside the band remains white, and interior pages return to
the regular document margins.

The included wordmarks and seal come from the official
[UiO master-front-page package](https://www.mn.uio.no/ifi/tjenester/it/hjelp/latex/uiomasterfp.zip).
The extension code is MIT-licensed; the UiO identity assets remain subject to
UiO's terms and are not relicensed here.
