[ch Simple Config File

    A simple config file is just a map of key/value pairs.


    [b JSON]

    Here is an example in JSON:

    [code language = JSON
        {
            "size": "XL",
            "color": "light orange",
            "transparent": true
        }
    code]

    Remarks:
    
    The need for quoting names is a bit annoying.

    Another inconvenience is the comma required at the end of each assignment, [i except the last one]. Each time we add a parameter at the end of the list, there is a risk of forgetting to add a comma at the existing second-last line.


    [b XML]

    There are different ways to do this in XML. It's typically done like this:

    [code language = XML
        <params>
            <size>XL</size>
            <color>light orange</color>
            <transparent>true</transparent>
        </params>
    code]

    Remark: The closing tags are noisy.

    
    [b pXML]

    The pXML version looks like this:
    
    [code language = none
        [params
            [size XL]
            [color light orange]
            [transparent true]
        ]
    code]

    Remark: The [c \[name value\]] syntax might seem a bit strange at first. But it's (hopefully) easy to get used to it quickly.

    
    [b Verbosity]

    To compare the verbosity of the three syntaxes, let's consider the length of the markup code (excluding whitespace) needed for one parameter:

    [table_data
        Language	Markup	Length	Range	Remark
        -
        JSON	"":"",	6	3 to 6	-2 for integer, boolean, and null values (because they are not quoted); -1 for the last parameter (because it doesn't have a trailing comma)
        XML	<></size>	9	min. 6	The length depends on the number of characters in the name
        pXML	[]	2	always 2	
    table_data]

    [b Conclusion]
    
    The most verbose syntax is XML (especially in case of long parameter names). The least verbose one is pXML with only 2 markup characters per parameter. Less noise implies 'easy to read and write for humans'.
]
