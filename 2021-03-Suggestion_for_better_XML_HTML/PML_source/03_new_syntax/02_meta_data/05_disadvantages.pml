[ch Disadvantages

    I looked hard for disadvantages before deciding to remove attributes in pXML. I am not an XML expert. So, if I missed something then please leave a comment. I will fix what needs to be fixed.
    
    Here are some points to consider:


    [nl]
    [b 1. New markup symbol]

    A new markup symbol ([c #]) has been added.
    
    However, this symbol can only appear as a prefix to an element name. Therefore there is no need to escape [c #] in text.

    Moreover, we have also [i removed] three markup symbols: [c =], [c "], and [c ']. And there is no more need to escape [c "] or [c '].


    [nl]
    [b 2. XML/pXML gap]

    Removing attributes increases the gap between XML and pXML. But the impact is less severe than it might seem at first.
    
    The basic concept of separating data and metadata remains the same.
    
    It is still easy to convert pXML to XML and vice versa.
    
    However, there is an incompatibility issue that arises when pXML code is converted to XML (e.g. read into an XML DOM or converted to XML code) [i and] pXML metadata uses structured data (not only strings). The issue arises because XML attributes support only strings. Some workarounds to consider could be:
    [list
        [el
            Store pXML metadata in XML elements too (all metadata, or just metadata with structured values).
            
            If needed, the distinction between data and metadata in XML elements could be made by using a specific prefix or suffix for the element name. For example [c #class] in pXML becomes [c _class] in XML (according to the [xref node_id=name_rules text=rules] XML element names can start with an underscore).
            
            Alternatively, one could add an attribute (or child-element) to flag an element as metadata, e.g.
            [code
                <rendering metadata="yes">
                    <color>blue</color>
                    <size>big</size>
                </rendering>
            code]
        ]
        
        [el
            Convert all structured pXML metadata into a string that can be stored in an XML attribute (might not be easy too implement).
        ]
        
        [el
            Allow only strings for pXML metadata. Pseudo-code:
            [code
                if XML_compatibility_required and type of metavalue is not string then
                    raise error
                .
            code]
        ]
    ]


    [nl]
    [b 3. Pain of change]

    Humans tend to [i resist change].

    The biggest obstacle for a new syntax might be the "pain of change". Some people might immediately be put off by the idea of removing attributes, because they are considered to be 'an essential part of XML'. Intuition shouts: "No, no, we can't do that!".
    
    Should we reject progress if the advantages justify a temporary effort?

    If we can:
    [list
        [el make it more simple]
        [el make it more powerful at the same time]
        [el without creating weighty, long-term disadvantages]
    ]
    ... then we should "Just do it!".
]
