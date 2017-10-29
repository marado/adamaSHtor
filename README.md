adamaSHtor
==========

O [Projecto Adamastor](http://projectoadamastor.org/) é um projecto Português que disponibiliza em formato digital, livre e gratuitamente, livros em Português, cujo texto se encontra em domínio público, em edições revisadas.

AdamaSHtor é um _script SHeLL_ que permite fazer o _download_ de todos livros disponíveis no _site_ do projecto, bastante útil para aqueles que querem ter a biblioteca completa, assim como para aqueles que querem fazer [prospecção de texto](https://github.com/TMMV/GeoLiteraturas).

Este repositório inclui [o _script_](adamaSHtor.sh), mas também os ficheiros disponíveis na última vez que corremos o _script_. Assim, se fizer o _download_ deste repositório, fará também o _download_ de todos os livros disponíveis na altura.

O [script](adamaSHtor.sh) está licenciado com [GPL v3 License](LICENSE).

## Dependências

Este _script SHeLL_ está escrito em [Bash](https://www.gnu.org/software/bash/) e tem as seguintes dependências:
* [HTML-XML-utils](https://www.w3.org/Tools/HTML-XML-utils/)
* [wget](https://www.gnu.org/software/wget/)
* [html2text](http://www.mbayer.de/html2text/)
 
adamaSHtor
==========

[Projecto Adamastor](http://projectoadamastor.org/) is a beautiful Portuguese
crowdsourced project to make available to the general public and for free
Portuguese books that belong to the public domain, in digital format.

Wether you find the project interesting enough to want to read them all, or you
want to empower the fact that those books are in Public Domain to [data mine
it](https://github.com/TMMV/GeoLiteraturas) or otherwise do innovative new
things, you might want to do more than just browse the website and click to
download the occasional book: you might want to simply have them all.

AdamaSHtor is a SHell script that, when run, goes to Projecto Adamastor's
website and downloads all the ebooks available there at the time.

This repository not only has [the script](adamaSHtor.sh) but also [the files that
were available in our last run of the script](books). In other words, if you
download this repository, you'll also be downloading all the books.

The [script](adamaSHtor.sh) has a [GPL v3 License](LICENSE), while the
[books](books) are in 
[public domain](https://en.wikipedia.org/wiki/Public_domain).

## Dependencies

This shell script is written in [Bash](https://www.gnu.org/software/bash/) and
has the following dependencies:
* [HTML-XML-utils](https://www.w3.org/Tools/HTML-XML-utils/)
* [wget](https://www.gnu.org/software/wget/)
* [html2text](http://www.mbayer.de/html2text/)
