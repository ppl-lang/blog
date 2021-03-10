[ch Advantages

    Using elements instead of attributes to store metadata has remarkable advantages:
    [list
        [el Complexity is significantly reduced]
        [el Metadata becomes as powerful as data]
        [el No confusion about using attributes or elements]
    ]
    
    Let's dig deeper and discover some practical benefits.


    [nl]
    [b 1. Complexity is significantly reduced.]

    In pXML data [i and] metadata:
    [list
        [el are defined with the same syntax]
        [el have the same features]
        [el are governed by the same rules]
        [el are accessed programmatically in the same way (same API)]
    ]
    This is not the case in XML. Attributes and elements have different syntaxes, different features, different rules, and different APIs.

    A few examples should demonstrate this.

    [b No quotes needed for values]
    
    Unlike XML, pXML metadata values never need to be quoted, even if they contain spaces. Therefore, [c "] and [c '] characters also never need to be escaped. Example:
    
    [code language=none
        XML:  <el arg1="foo bar" arg2="&quot;'" arg3='&apos;"' />
        pXML: [el [#arg1 foo bar] [#arg2 "'] [#arg3 '"]]
    code]

    [b Escaping becomes simpler.]

    Five characters must be escaped in XML:
    [table_data
        Character	Escape Entity
        -
        <	&lt;
        >	&gt;
        "	&quot;
        '	&apos;
        &	&amp;
    table_data]
    Escape rules define when we [i need] to escape, and when it is an [i option]. In XML the rules depend on the context (e.g. attribute or element). They are explained in this [link url=https://stackoverflow.com/questions/1091945/what-characters-do-i-need-to-escape-in-xml-documents text=Stackoverflow entry].

    In pXML there are only three characters to escape, and the escape tokens are easier to remember and write:
    [table_data
        Character	Escape Token
        -
        [	\[
        ]	\]
        \	\\
    table_data]
    The rule is simple: All three characters must always be escaped in text (data and metadata). There are no exceptions.

    Example of metadata with characters that must be escaped:

    [code
        // metadata value: Watch out for <, >, ", ', &, [, ], and \ characters
        
        XML:  note = "Watch out for &lt;, &gt;, &quot;, &apos;, &amp;, [, ], and \ characters"
        pXML: [#note Watch out for <, >, ", ', &, \[, \], and \\ characters]
    code]


    [b Grammar becomes simpler]

    Removing attributes significantly simplifies the pXML grammar (typically expressed in EBNF).

    Hence writing a parser for pXML is easier than writing one for XML. All other tools exploring the structure also become easier to implement and use.


    [nl]
    [b 2. Metadata become as powerful as data.]

    Chapter "XML Elements vs. Attributes" on [link url=https://www.w3schools.com/xml/xml_dtd_el_vs_attr.asp text=W3Schools] states:

    [div html_style="padding-left: 2em; background-color: #f8f8f8;"
        Some of the problems with attributes are:
        [list
            [el attributes cannot contain multiple values (child elements can)]
            [el attributes are not easily expandable (for future changes)]
            [el attributes cannot describe structures (child elements can)]
            [el attributes are more difficult to manipulate by program code]
            [el attribute values are not easy to test against a DTD]
        ]
    ]

    By removing attributes all these problems vanish. Storing metadata in elements makes them as powerful as normal data.

    For example, the value of an XML attribute can only be a string. In pXML, metadata can also be stored as a structure (tree of values) which means:
    [list
        [el A validation mechanism (such as XMLSchema, RelaxNG or Schematron in XML) can be applied to specify the structure and to detect invalid metadata quickly at parse time.]
        
        [el
            Components of metadata (tree nodes) can be accessed programmatically more easily and more reliably with standard XML techniques.
            
            Say we have the following XML attribute:
            [code
                style = "color: blue; font-family: Arial; background-color: inherit;"
            code]
            Now suppose we need to extract the value of [c font-family]. To achieve this we would need to write a mini-parser that extracts the value. Not a trivial task if it needs to work well in all variations of defining the [c style] attribute.

            In pXML [c style] could be defined like this:
            [code
                [#style
                    [color blue]
                    [font-family Arial]
                    [background-color inherit]
                ]
            code]
            After loading the code into an XML document we can easily and reliably extract the value of [c font-family] with standard XML techniques such as XPath or XML Query.
        ]
        
        [el
            Components of metadata are easier and less error-prone to insert, modify, and delete.

            Again, standard XML techniques can be used to do that.
        ]
    ]

    Here is an example of pXML metadata [c #GUI_data] defined as a nested data structure:
    [code
        [grid_cell
            [#GUI_data
                [grid_position
                    [line 10]
                    [column 2]
                ]
                [color
                    [text purple]
                    [background yellow]
                ]
            ]
            [content Cell content]
        ]
    code]
    Note that element names within metadata don't need to be prefixed with [c #], because the content of metadata is obviously metadata too.


    [nl]
    [b 3. No confusion about using attributes or elements.]

    As said already in chapter [xref node_id=XML_attributes] there is a lot of confusion in the XML world about when to use attributes and when to use elements.

    Sometimes attributes are used while the correct way would be to use elements, or vice-versa. If the mistake is fixed later, all code that accesses the data must be updated too, because XML attributes have a different API than elements. Moreover, entities used to escape characters might need to be adapted too, because the rules for escaping characters in attributes and elements are different. This can turn into a frustrating and error-prone process.

    In pXML there is no such confusion, because data and metadata are all stored in elements.

    The temptation to use attributes to reduce verbosity vanishes too and doesn't make sense anymore, because the number of markup characters for pXML elements is the same as for XML attributes. Example:
    [code
        XML element:   <identifier>123</identifier>
        XML attribute: identifier="123"
        pXML element:  [identifier 123]
    code]

    There is only one question that arises in pXML: "Is this value data or metadata?". If it is metadata then the element's name should be prefixed with [c #]. That's it. If the initial choice was wrong, it can easily be changed later. No need to worry about escaping, and less API changes.

    [note
        Deciding whether a value is data or metadata can sometimes be a bit tricky. Advice on this is out of scope of this article. If in doubt, choose 'data'. Or get some tips from [link url=http://www.cafeconleche.org/books/effectivexml/chapters/12.html text=Store metadata in attributes].
    ]
]
