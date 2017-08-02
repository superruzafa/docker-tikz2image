#!/bin/bash

FORMAT=png

while getopts ":f:" opt; do
  case $opt in
    f)
      case $OPTARG in
        pdf|png|svg|jpg)
          FORMAT=$OPTARG
          ;;
        *)
          echo "Invalid format $OPTARG" >&2
          exit 1
          ;;
        esac
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

pdflatex -halt-on-error -jobname=input > /dev/null 2>&1

cat input.log >&2

if [ $? -ne 0 ]; then
  exit 1
fi

echo "Converting to .$FORMAT..." >&2

case $FORMAT in
  pdf)
    cat input.pdf
    ;;
  png|jpg)
    convert input.pdf output.$FORMAT
    cat output.$FORMAT
    ;;
  svg)
    pdf2svg input.pdf output.svg
    cat output.svg
    ;;
esac
