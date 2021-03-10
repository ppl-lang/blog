[ch pXML Predecessor

    When I started to ponder about the new syntax, I didn't think at all about creating a better XML/HTML syntax. What I [i wanted] was a new syntax to write articles (published on a blog) and books. Initially I used Docbook, then Asciidoctor to write articles. I also tried out Markdown, and had a look at other syntaxes like RestructedText. To make a long story short: I felt frustrated with some impracticabilities of existing solutions, and finally decided to design a new syntax called [i Practical Markup Language ([b PML])]. If you want to know more about my motivation to create PML, you can read [link url=https://www.pml-lang.dev/docs/articles/practical-document-markup-language/index.html text=We Need a New Document Markup Language - Here is Why] (published in March 2019). (Note: For readers still using a word processor, I also wrote [link url=https://www.pml-lang.dev/docs/articles/advantages-markup-language-vs-word-processor/index.html text=Advantages of Document Markup Languages vs WYSIWYG Editors])

    Nowadays I write all my articles in PML (including this one). To publish them I created a [i PML to HTML Converter] which reads a PML file and creates a HTML file. You can have a look at the PML source of this article [link url=https://www.pml-lang.dev/TODO text=here], and you can see the original version of it [link url=https://www.pml-lang.dev/TODO text=here] (i.e. the result produced by the [i PML to HTML Converter]). Right-click on the original article, and click 'View Page Source' if you want to have a look at the HTML code produced by the  [i PML to HTML Converter]. The converter produces indented, clean and simple HTML code, like hand-coded. The [i PML to HTML Converter] is open-sourced under the GPL2, and written in [link url=https://www.ppl-lang.dev text=PPL] ([i Practical Programming Language]). The source code is on [link url=https://www.github.com/pml-lang/converter text=Github].

    After creating PML, I suddenly realized that it's syntax could also be used to write XML/HTML documents - a nice side effect. This article is my first step in making my idea public.

    One could say that PML is to pXML like HTML is to XML. PML uses the pXML syntax, but only predefined, sematic PML tags are allowed. PML still use attributes, but I want to change that in the future.
]
