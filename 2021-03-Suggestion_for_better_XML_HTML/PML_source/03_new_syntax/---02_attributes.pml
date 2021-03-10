[ch Attributes

[ch Assignments

    Here is an example of an XML element with attributes:

    [code
        <div id="unplug_warning" class="warning">Unplug power cord before opening!</div>
    code]

    In pXML, there is no symbol to close the opening tag (like [c >] in the XML example above). Therefore we need to use open/close symbols for attributes. Let's use [c (] and [c )]:

    [code
        [div ( id="unplug_warning" class="warning" ) Unplug power cord before opening!]
             ^                                     ^
    code]
    
    [note
        Using parenthesis to embed assignments is a familiar syntax for most programmers, because many programming languages (C#, Java, etc.) use parenthesis to surround parameter assignments to functions.
    ]

    If an element doesn't have attributes, it can be stated explicitly like this:
    [code
        [div() foo]
    code]

    ... which is semantically equivalent to:
    [code
        [div foo]
    code]

    In rare situations we [i need] to use empty parenthesis. Suppose that an element contains the text [c (organic = good)]. Then we can't write:
    [code
        [b (organic = good)]
    code]
    ... because the parser would interpret this as the value [c good] assigned to an attribute named [c organic].

    Hence we need to write:
    [code
        [b() (organic = good)]
    code]
    ... to make it clear there are no attributes.

    To increase readability, attribute assignments can be written on separate lines, as this:
    [code
        [image (
            source = images/kid.png
            title  = "Kid is flabbergasted"
            width  = 800px
            height = 600px
        )]
    code]

    [note
        XML doesn't specify when to use attributes instead of elements. However, it's considered good practice to use attributes only for [i metadata] (data about data). All [i data] should be stored in child-elements.

        Here is a rewrite of a [xref node_id=albert_example text=previous] example that demonstrates how [i not] to use attributes:
        [code language=XML
            <person name="Albert" married="true">
                <address street="Kramgasse" city="Bern" />
                <phones>
                    <phone>123</phone>
                    <phone>456</phone>
                </phones>
            </person>
        code]

        HTML code like the following one is fine, because the attribute is used to store metadata:
        [code language=HTML
            <span class="redOnYellow">Good News!</span>
        code]
    ]
]


[ch Names

    In XML, attribute names are not quoted (unlike in JSON), and they must respect the same rules as we [xref node_id=name_rules text=previously] saw for element tag names.
    In order to stay compatible with XML, pXML applies the same rules.
]

[ch Values

    Writing:
    [code
        name = "Bob"
    code]
    ... is a bit annoying, because in this case there is no necessity to quote the value. We would like to be able to write [c name = Bob] instead of [c name = "Bob"].

    Attribute values with no necessity for quotes appear often in practice. Therefore pXML allows unquoted attribute values if the value [i does not contain]:
    [list
        [el whitespace (spaces, tabs, carriage returns, line feeds)]
        [el quotation marks ([c "])]
        [el square brackets ([c \[] and [c \]])]
        [el Unicode escape sequences (e.g. [c \u12fe])]
        [el XML entities (e.g. [c &lt;],  [c &gt;])]
    ]

    Because no escapes are allowed, parsing unquoted attribute values is a bit faster because there is no need to unescape the value.

    Quoted attribute values [i can contain]:
    [list
        [el spaces (e.g. [c "healthy orange"])]
        [el the following escape characters: \\t \\r \\n \\" \\' \\\\ \\\[ \\\] (easier to read and write than XML entities, especially for programmers who are familiar with this syntax)]
        [el Unicode escape sequences (e.g. [c \u12fe])]
        [el XML entities]
    ]
]

]
