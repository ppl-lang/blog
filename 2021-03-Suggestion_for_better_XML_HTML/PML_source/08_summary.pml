[ch Summary And Conclusion

    As demonstrated, it [i is] possible to simplify the XML syntax and make it more accessible for humans.

    The pXML syntax introduced in this article essentially suggests two improvements:
    [list
        [el
            Replace the XML syntax:
            [code
                <name>value</name>
            code]
            ... with:
            [code
                [name value]
            code]
        ]
        [el
            Remove attributes and use the [c #] element name prefix to make a distinction between data and metadata.
            
            The XML code:
            [code
                name = "value"
            code]
            ... becomes:
            [code
                [#name value]
            code]
        ]
    ]

    The following picture illustrates the simplification achieved with pXML:
    [image src=images/n_v.png width=400 align=center html_alt=From XML to pXML]

    Although the pXML syntax is less verbose and less complex, it does not make XML less powerful. Once a pXML document is parsed into an XML tree, the whole set of great additions that are part of the XML ecosystem can still be used: documents can be validated, queried, modified, and transformed.
    
    pXML also adds two features not supported in XML:
    [list
        [el Metadata can contain structured data, instead of just strings.]
        [el Comments can be nested.]
    ]

    Well designed syntax increases productivity, reduces errors, eases maintenance, and improves space and time efficiency. And that makes us feel good.

    Syntax matters!
]
