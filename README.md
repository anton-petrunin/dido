##Сборка статьи

`cd mppics/`<br>
`mpost pic`<br>
`cd ..`<br>
`pdflatex dido`<br>
`biber dido`<br>
`pdflatex dido`<br>

##Файлы

Создать архив со всеми нужными файлами:

`zip -r arXiv.zip -@ < arXiv.txt`
