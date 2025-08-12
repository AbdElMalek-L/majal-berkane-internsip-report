#!/bin/env perl

$pdf_mode = 5;  # Use XeLaTeX
$postscript_mode = 0;  # No PostScript
$dvi_mode = 0;  # No DVI

# Main TeX file
$root_filename = 'IPLeiriaMain.tex';

# XeLaTeX command
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -shell-escape %O %S';

# PDF settings
$xdvipdfmx = 'xdvipdfmx -V 1.7 -o %D %O %S';  # Set PDF version to 1.7

# Clean up settings
$clean_ext = 'acn acr alg aux bbl bcf fdb_latexmk fls glg glo gls ist lof log lot out run.xml slg slo sls toc xdv';

# Force processing
$force_mode = 1;
