[![](https://images.microbadger.com/badges/image/superruzafa/tikz2image.svg)](https://microbadger.com/images/superruzafa/tikz2image "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/superruzafa/tikz2image.svg)](https://microbadger.com/images/superruzafa/tikz2image "Get your own version badge on microbadger.com")

# superruzafa/tikz2image

Converts Tkiz (La)TeX documents into images.

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

