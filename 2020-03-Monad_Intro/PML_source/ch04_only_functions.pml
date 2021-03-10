{ch Only Functions!

    In the previous Java example we used {i object methods} (e.g. {c sentence.trim()}). However, as this article is about monads, we have to be aware that pure functional programming languages don't have methods (functions) executed on objects. A pure functional programming language (based on the lambda calculus) has only side-effect-free functions that take an input and return a result.

    Let us therefore rewrite the previous code (still in Java) by using only pure functions. This is important, because we have to use functions in order to finally understand why monads have been invented.

    Here is the new code:
    {insert_code highlighter=none file=[[examples_root]]/test_02/MonadTest_02.java \
        from_regex = "// start example\r?\n" \
        include_from_regex = no \
        to_regex = "\r?\n\s*// end example" \
        include_to_regex = no }

    The code starts with three pure functions ({c trim}, {c toUpperCase}, and {c appendExclam}) that take a string as input, and return a string as result. Note that I cheated a bit, because I still use object methods in the function's bodies (e.g. {c string.trim()}). But that doesn't matter here, because in this exercise we don't care about the {i implementations} of these three functions - we care about their {i signatures}.
    
    The interesting part is the body of function {c enthuse}:
    {code highlighter=none
        return appendExclam ( toUpperCase ( trim ( sentence ) ) );
    code}

    We can see that there are only function calls (as in functional programming languages). The calls are nested, and executed like this:
    {list
        {el step 1: {c trim ( sentence )} is executed}
        {el step 2: the result of step 1 is fed into {c toUpperCase}}
        {el step 3: the result of step 2 is fed into {c appendExclam}}
        {el finally the result of step 3 is returned as the result of function {c enthuse}}
    }

    The following picture illustrates how the initial input is transformed by chaining three functions:
    {nl}
    {image src=images/hello_bob_functions_chains.png width=700}

    To see if everything still works fine we can execute function {c test}. The result remains the same:
    {output
        HELLO BOB!
    output}
}
