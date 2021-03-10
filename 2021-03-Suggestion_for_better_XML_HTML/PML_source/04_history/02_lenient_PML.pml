[ch Lenient Syntax in PML id=lenient_PML

    An important aspect of PML is the parser's ability to work in [i lenient mode]. This mode supports very targeted syntax simplifications, aiming to eliminate as much "noise" as possible. It should be as easy as possible to write articles and books in PML. Here is an example to illustrate the advantage of the [i lenient syntax]:

    Below is the code of a simple PML document, written in strict pXML:

    [code
        [document [title Test]
            [chapter [title An Unusual Surprise]
                [paragraph Look at the following picture:]
                [image [source images/strawberries.jpg]]
                [paragraph Text of paragraph 2]
                [paragraph Text of paragraph 3]
            ]
        ]
    code]

    In lenient PML mode (always activated), the text can be shortened to:

    [code id=pml_lenient_example
        [doc Test
            [ch An Unusual Surprise
                Look at the following picture:
                [img images/strawberries.jpg]
                
                Text of paragraph 2

                Text of paragraph 3
            ]
        ]
    code]

    Let's briefly see how this works:

    [list
        [el
            [c document] becomes [c doc]:

            Most PML tags have alternative short names, besides their standard, more verbose name (e.g. [c doc] instead of [c document], [c p] instead of [c paragraph], [c ch] instead of [c chapter], etc.)
        ]

        [el
            [c \[title Test\]] becomes [c Test]:

            Some elements (for example [c chapter] and [c image]) have one so-called [i default child-element]. For that element only the value can be specified - it is not necessary to write [c \[name value\]]
        ]

        [el
            [c \[paragraph Text of paragraph 2\]] becomes [c Text of paragraph 2]:

            If text is not contained in a [c paragraph] (or simply [c p]) element, it is automatically embedded in a [c paragraph] element.

            Text separated by two new lines automatically creates a paragraph break.
        ]
    ]

    If you want to try out the above code, you can proceed like this:
    [list
        [el [link url=https://www.pml-lang.dev/downloads/install.html text=Download] the [i PML to HTML Converter]]
        
        [el
            Create file [c example.pml] in any directory, with the PML code shown above (the strict pXML version will not work).
        ]

        [el Copy a picture to [c resources/images/strawberries.jpg]]

        [el
            Open a terminal in the directory of file [c example.pml] and type
            [input
                pmlc example.pml
            input]
        ]

        [el
            Open file [c output/example.html] in your browser.

            The result looks like this:
            [img images/lenient_example.png border=yes width=400 html_alt=HTML page created by PML]
        ]

        [el Right-click on the text, and select 'View Page Source' if you want to see the HTML code produced by the  [i PML to HTML Converter].]
    ]
]
