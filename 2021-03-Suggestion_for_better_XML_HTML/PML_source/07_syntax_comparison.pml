[ch Syntax Comparison

    Here is a brief comparison of the XML vs pXML syntax:

    Empty element:
    [code
        XML:  <br />
        pXML: [br]
    code]

    Element with text content:
    [code
        XML:  <summary>text</summary>
        pXML: [summary text]
    code]

    Element with child elements:
    [code
        XML:  <ul>
                  <li>
                      <div>A <i>friendly</i> dog</div>
                  </li>
              </ul>

        pXML: [ul
                  [li
                      [div A [i friendly] dog]
                  ]
              ]
    code]

    Element with metadata:
    [code
        String metadata:
        XML:  <div id = "unplug_warning" class = "warning big-text">Unplug power cord before opening!</div>
        pXML: [div [#id unplug_warning] [#class warning big-text]Unplug power cord before opening!]

        Structured metadata:
        XML:  not supported
        pXML: 
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

    Escaping:
    [code
        XML:  note = "Watch out for &lt;, &gt;, &quot;, &apos;, &amp;, [, ], and \ characters"
        pXML: [#note Watch out for <, >, ", ', &, \[, \], and \\ characters]    
    code]

    Comments:
    [code
        Single comment:
        XML:  <!-- text -->
        pXML: [- text -]

        Nested comments:
        XML:  not supported
        pXML: [- text [- nested -] -]
    code]
]