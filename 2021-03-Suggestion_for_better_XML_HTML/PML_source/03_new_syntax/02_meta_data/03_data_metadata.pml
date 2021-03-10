[ch Separation of Data And Metadata

    What we [i need] is a separation of metadata and data, because that's sometimes very useful (and heavily used in HTML to style documents). However, we don't need [i attributes] to make that separation. We can just use [i elements] to store metadata. We only need to find a way to distinguish elements that contain metadata from those who contain data. I finally opted to use the character [c #] as a name prefix for elements containing metadata. The reason for this choice is that we can think of [c #] as [i different] (not equal). Metadata are [i different] from data, so [c #] is easy to remember. Moreover, according to the XML [xref node_id=name_rules text=naming rules] (which are also applied in pXML) [c #] is not allowed in a name. Hence there is no clash, no ambiguity.

    As a result, the following HTML code:
    [code language=HTML
        <span class="redOnYellow">Good News!</span>
    code]
    ... is written like this in pXML (note the [c #] prefix for [c class]):
    [code language=none
        [span [#class redOnYellow]Good News!]
    code]
    
    Yes, this might look unappealing at first - especially for people used to look at HTML code for years.

    Nobody is required to agree immediately. Let's first calmly look at advantages and disadvantages.
]
