{ch An OO Bind

    Now that we know how a monad works in functional programming languages, let's go back to the world of OOP (object-oriented programming). Could we create something like an OO-monad?

    If we look at class {xref node_id=ResultOrErrorMonad}, we can see that everything in this class is already standard Java, with one exception: Function {c bind} is a static member of the class. This means we can't use the dot-syntax of object methods for {c bind}. Currently the syntax for calling {c bind} is {c bind ( v, f )}. But if {c bind} was a non-static member of the class, we could write {c v.bind ( f )}. This would make the syntax more readable in the case of nested function calls.
    
    Luckily, it's easy to make {c bind} non-static.

    To make the monad a bit more versatile, let's also introduce a second type parameter for error values. Then the users are not required to use {c SimpleError} - they can use their own error class.

    Here is the code of a {c ResultOrError} monad, OO-style:
    {insert_code highlighter=none file=[[examples_root]]/test_07/ResultOrError.java from_regex="public class ResultOrError"}

    Now the code for using bind in the body of function {c enthuse} becomes more readable. Instead of writing:
    {code highlighter=none
        return bind ( bind ( trim ( sentence ), v -> toUpperCase(v) ), v -> appendExclam(v) );
    code}
    ... we can avoid the nesting and write:
    {code highlighter=none
        return trim ( sentence ).bind ( v -> toUpperCase(v) ).bind ( v -> appendExclam(v) );
    code}

    So, can monads be useful in real-world OOP environments?

    Yes, they {i can}.
    
    But the word "can" needs to be stressed, because it depends (as so often) on what we want to achieve. Let's say, for instance, that we have some good reasons to 'not use exceptions' for error handling.

    Remember the ugly error-handling code we had to write in chapter {xref node_id=errors}:
    {insert_code highlighter=none file=[[examples_root]]/test_03/MonadTest_03.java \
        from_regex = "// start enthuse_1\R" \
        include_from_regex = no \
        to_regex = "\R\s*// end enthuse_1" \
        include_to_regex = no }

    Using a monad removes the boilerplate:
    {code highlighter=none
        static ResultOrError enthuse ( String sentence ) {
            return trim ( sentence ).bind ( v -> toUpperCase(v) ).bind ( v -> appendExclam(v) );
        }
    code}

    Nice!
}