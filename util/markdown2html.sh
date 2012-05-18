#!/bin/sh

if [ -z "$1" ]
then
    echo "Usage: ./markdown2html markdown_document"
    exit 1
fi

cat common_header.html
./Markdown.pl $1 | ruby translate.rb
cat common_footer.html
