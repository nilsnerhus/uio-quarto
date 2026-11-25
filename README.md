# UiO-Quarto

Hei! Denne Quarto-utvidelsen er for deg som skal skrive en semester-, bachelor- eller masteroppgave på UiO i Quarto og vil ha en rask og grei `pdf`-fil når du er ferdig. Prosjektet starta som et forsøk på å oversette [LaTeX-malen til UiO](https://www.mn.uio.no/ifi/tjenester/it/hjelp/latex/), men alle feil og avvik fra den er mine.

## INSTALLASJON

Du installerer utvidelsen i prosjektet ditt ved å gjøre dette:

```sh
quarto add nilsnerhus/uio-paper
```

Når du har gjort det må du velge det øverst i Quarto-fila di, som dette:

```yaml
format:
  uio-paper-typst: default
```

## INNSTILLINGER

Hvis lister ikke er din greie, så er det også et [eksempeldokument](eksempel.qmd) i mappa som du heller kan se på. Alle instillingene er yaml frontmatter-verdier, der noen er standard-verdier fra Quarto og derfor på engelsk:

| Key             | Value                 | Forklaring                           |
| --------------- | --------------------- | ------------------------------------ |
| title           | "Eksempeltittel"      |                                      |
| subtitle        | "Undertittel"         |                                      |
| author          | "Nils Rørstad"        | Én forfatter, eller liste            |
| date            | "today"               | Dagens dato                          |
| lang            | "nb"                  | Setter språket                       |
| toc             | true                  | Legger til innholdsfortegnelse       |
| toc-title       | "innholdsfortegnelse" | Gir navn til innholdsfortegnelsen    |
| number-sections | true                  | Nummererer kapitler og underkapitler |

De jeg har lagt til, kun for denne forsiden er:

| Key       | Value             | Forklaring                                |
| --------- | ----------------- | ----------------------------------------- |
| forside   | true              | Legger til forsiden                       |
| oppgave   | "Semesteroppgave" | Legger til en liten boks med oppgavetypen |
| emne      | "Emnekode"        |                                           |
| institutt | "Institutt"       |                                           |
| fakultet  | "Fakultet"        |                                           |

## ORDTELLER

Så, hvis du har lyst til å legge til en ordteller, for å automatisk få riktig antall ord på forsiden, må du bruke enda en utvidelse:

```sh
quarto add christopherkenny/wordcount
```

Og så legge til dette i toppen av fila di:

```yaml
filters:
  - wordcount
ordantall: "{{wordcount}} ord"
```
