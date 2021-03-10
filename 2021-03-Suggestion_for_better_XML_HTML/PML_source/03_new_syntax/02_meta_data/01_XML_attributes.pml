[ch XML Attributes id=XML_attributes

    Besides elements, XML also supports [i attributes]. Here is an example of an XML element with attributes:
    [code
        <div id="unplug_warning" class="warning big-text">Unplug power cord before opening!</div>
    code]

    XML doesn't specify when to use attributes instead of elements. However, it's considered [link url=https://www.w3schools.com/xml/xml_dtd_el_vs_attr.asp text=good practice] to use attributes only for [i metadata] (data about data). All [i data] should be stored in child-elements.

    Here is an reprint of a simple data structure we saw in a [xref node_id=albert_example text=previous] chapter:
    [code language=XML
        <person>
            <name>Albert</name>
            <married>true</married>
            <address>
                <street>Kramgasse</street>
                <city>Bern</city>
            </address>
            <phones>
                <phone>123</phone>
                <phone>456</phone>
            </phones>
        </person>
    code]

    We [i could] use attributes for some data and rewrite the code like this:
    [code language=XML
        <person name="Albert" married="true">
            <address street="Kramgasse" city="Bern" />
            <phones>
                <phone>123</phone>
                <phone>456</phone>
            </phones>
        </person>
    code]

    However we should not do that if we follow the general advice that attributes should be used for [i meta]data. Clearly, [c name], [c married], [c street], and [c city] are [i not] metadata, they are data.

    In practice, people sometimes use attributes for data because it reduces verbosity (as can be seen in the above example) or maybe because they are not aware of the general advice. Searching the net for 'xml elements vs attributes' reveals that there is [i a lot] of confusion, as shown [link url=https://stackoverflow.com/questions/33746/xml-attribute-vs-xml-element text=here], [link url=https://stackoverflow.com/questions/1096797/should-i-use-elements-or-attributes-in-xml text=here], and [link url=https://www.ibm.com/developerworks/library/x-eleatt/index.html text=here], for example.

    HTML code like the following one is fine, because the attribute is used to store metadata:
    [code language=HTML
        <span class="redOnYellow">Good News!</span>
    code]

    It is important to note that we [i could] also use an element for [c class] (thereby violating the advice):
    [code language=HTML
        <span><class>redOnYellow</class>Good News!</span>
    code]
]
