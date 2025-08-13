
### What this project is
- A LaTeX thesis/report template for Polytechnic University of Leiria, producing `IPLeiriaMain.pdf`.

### Entry points and build
- **Main document**: `IPLeiriaMain.tex` (includes all content, front matter, and bibliography).
- **Class**: `IPLeiriaThesis.cls` (defines options like `school`, `language`, `chapterstyle`, `coverstyle`, `docstage`, `media`, `linkcolor`, `doctype`, `bookprint`, `aiack` and loads required packages).
- **Build**: `latexmkrc` configures XeLaTeX with `-shell-escape`; `Makefile` wraps latexmk/rubber. Output and aux files are present in root (e.g., `.aux`, `.bbl`, `.log`, `.pdf`).

### Directory structure (purpose)
- **`Configurations/`**: Style and behavior via `.sty` modules, loaded in order by the class
  - `00-Fonts.sty`, `01-Colors.sty`, `02-Margins.sty`, `03-References.sty`, `04-Headers.sty`, `05-Contents.sty`, `06-Glossary.sty`, `07-Chapters.sty`, `08-Tables.sty`, `09-Code.sty` (minted/syntax highlight), `10-Macros.sty`, `11-Metadata.sty`; plus `Fonts/`.
- **`Matter/`**: Front/back matter and global lists
  - `00-Cover.tex`, `01-Front-Page.tex`, `02-Copyright.tex`, `03-Acknowledgements.tex`, `04-AI.tex` (AI acknowledgement), `05-Glossary.tex`, `06-Acronyms.tex`, `07-Symbols.tex`, `08-Appendices.tex`, `09-Annexes.tex`, `10-Back-Page.tex`.
- **`Chapters/`**: Main content
  - `00-Abstract.tex`, `01-Introduction.tex`, `02-User-Guide.tex`, `03-Latex-Tutorial.tex`, plus `Appendices/` (`00-AppendixA.tex`, `01-AppendixB.tex`) and `Annexes/` (`00-AnnexA.tex`).
- **`Metadata/`**: `Metadata.tex` (title, author, degree, dates, etc.), included by `IPLeiriaMain.tex`.
- **`Bibliography/`**: `Bibliography.bib`, referenced at the end of `IPLeiriaMain.tex`.
- **`Figures/`**: Figures and theme assets; used across content.
- **`Assets/`**: Template logos/preview images.
- **`Code/`**: Example code listings (e.g., `Factorial.hs`) for minted.
- Dev/config folders: `.github`, `.vscode`, `.devcontainer.json`.

### How content is wired
- `IPLeiriaMain.tex` sets class options, inputs `Metadata/Metadata`, loads glossaries/acronyms/symbols, includes front matter in `Matter/`, then chapter files in `Chapters/`, prints bibliography, then `\appendix` and includes `Appendices/` and `Annexes/`, finally back page.
- Bibliography is printed via `\printbibliography` with title and ToC entry.
- Code highlighting uses `minted` (requires `-shell-escape`); you’ll see a `_...data.minted` cache in root.

### Typical customization points
- **Document options**: in `\documentclass[...]` inside `IPLeiriaMain.tex` (e.g., `language=english`, `school=eniad`, `chapterstyle=classic`, etc.).
- **Metadata**: edit `Metadata/Metadata.tex`.
- **Chapters**: add new `Chapters/<nn>-Title.tex` and include them in `IPLeiriaMain.tex`.
- **Bib**: add entries to `Bibliography/Bibliography.bib`.
- **Styling**: tweak `.sty` files under `Configurations/` (colors, margins, headers, tables, code, macros).

### Build notes
- On Windows with latexmk: run `latexmk -pdf -xelatex -shell-escape IPLeiriaMain.tex`.
- The `Makefile` is tailored for Unix shells but shows intended flags; `latexmkrc` already sets XeLaTeX and clean extensions.

- Adjust `Matter/05-Glossary.tex`, `06-Acronyms.tex`, `07-Symbols.tex` if you use glossaries/acronyms; `\makeglossaries` is already set.

- The repo currently includes compiled artifacts (e.g., `IPLeiriaMain.pdf`) alongside sources.

- Summary:
  - Central entry `IPLeiriaMain.tex` orchestrates content and options.
  - Formatting modularized in `Configurations/*.sty`, applied via `IPLeiriaThesis.cls`.
  - Content split into `Matter/` and `Chapters/` (plus `Appendices/` and `Annexes/`).
  - Assets and figures separated; bibliography isolated; code listings supported with minted.