[ch Closing Tags

    When nested elements are closed, we often see HTML code like this:
    [code
        </img></div></section>
    code]

    If indentation is used, it looks like this:
    [code
                </img>
            </div>
        </section>
    code]

    In pXML the code without indentation becomes:
    [code
        ]]]
    code]

    With indentation:
    [code
                ]
            ]
        ]
    code]

    While the new syntax obviously improves writing-speed and reduces the size of code, it also creates two inconveniences:
    [list
        [el
            The code becomes less understandable, especially in case of big, nested elements.
        ]
        
        [el
            In case of a missing [c \]] (i.e. we forget to close an element) or a superfluous [c \]], the error message generated by the parser risks to be less helpful. For example, imagine a superfluous [c \]] in the middle of a big document. The parser will only be able to detect the error at the end of the document, and report a superfluous [c \]] at the last line.
            
            Note, however, that this problem can be largely mitigated when elements are indented, and the parser emits a warning if the indentation of the opening [c \[] and closing [c \]] are different.
        ]
    ]

    To eliminate these inconveniences we should support an [i alternative], more verbose syntax to close elements.

    Obvious options like [c \[/tag\]] or [c tag\]] don't work, because they create an imbalance of brackets, or they require special rules for exceptional corner cases. I finally opted for the following alternative syntax:
    [code
        ][/tag]
    code]

    Hence the above code to close three elements can optionally be written like this:
    [code
        ][/img] ][/div] ][/section]
    code]
    ... or this
    [code
                ][/img]
            ][/div]
        ][/section]
    code]

    This is a bit more verbose than the XML syntax, because there is one more character per closing tag. But it is also a bit easier to write because the [c Shift] key doesn't have to be used twice. In practice the verbose syntax is only needed to close big tags with many levels of child elements. So I think the alternative pXML syntax to close tags is a good compromise. It's there if you need it, and it works well (no corner cases that require special rules).
]
