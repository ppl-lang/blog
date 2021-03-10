[ch Attributes in pXML?

    In the first draft of this article, attributes were supported in pXML.
    The above XML example:
    [code
        <div id="unplug_warning" class="warning big-text">Unplug power cord before opening!</div>
    code]
    ... would be written like this in pXML:
    [code
        [div ( id=unplug_warning class="warning big-text" ) Unplug power cord before opening!]
    code]

    As shown, attribute assignments were embedded in parenthesis (which is familiar to many programmers), and attribute values without spaces didn't need to be quoted (e.g. [c id=unplug_warning]).

    Right after I finished the chapter about pXML attributes, I leaned back and asked myself: "Do we really [i need] attributes?".

    One of the best general advice for good engineering popped up in my mind:
    [quote source=Antoine de Saint-Exupery
        Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.
    ]

    After playing around with some examples, I concluded: "No, we do not need attributes!".

    So let's be bold. Let's remove attributes. We don't need them. As we'll see soon, we'll reap some nice benefits from doing so.
]

