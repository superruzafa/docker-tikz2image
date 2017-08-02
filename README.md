# superruzafa/tikz2image

Converts Tkiz (la)tex documents into images.

## Usage

```
$ cat tikz.tex
\documentclass{standalone}
\usepackage{tikz}
\begin{document}
  \begin{tikzpicture}
    \node {Hello Tikz!};
  \end{tikzpicture}
\end{document}

$ cat tikz.tex | docker container run --rm -i superruzafa/tikz2image -f png 2>/dev/null > tikz.png
```

Available output formats:

* png (by default)
* jpg
* svg
* pdf

