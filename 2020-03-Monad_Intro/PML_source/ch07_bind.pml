{ch The 'bind' Function

    In functional programming languages, everything is done with functions. So we know already that we have to create a function to solve our problem.

    Let's call this function {c bind}, because it's role is to bind two functions that cannot be composed directly.

    Next we have to decide what should be the input of {c bind}, and what should it return. Let's consider the case of chaining functions {c trim} and {c toUppercase}:
    {image src=images/trim_toUppercase_functions_chains.png}

    The logic to implement must work as follows:
    {list
        {el If {c trim} returns a string, then {c toUppercase} can be called, because it takes a string as input. So the final output will be the output of {c toUppercase}}
        {el If {c trim} returns an error, then {c toUppercase} cannot be called, and the error must simply be forwarded. So the final output will be the output of {c trim}}
    }

    We can deduce that {c bind} needs two input arguments:
    {list
        {el the result of {c trim}, which is of type {c ResultOrError}}
        {el function {c toUppercase}, because if {c trim} returns a string then {c bind} must call {c toUppercase}}
    }

    The output type of {c bind} is easy to determine. If {c trim} returns a string then the output of {c bind} is the output of {c toUppercase}, which is of type {c ResultOrError}. If {c trim} fails then the output of {c bind} is the output of {c trim}, which is also of type {c ResultOrError}. As the output type is {c ResultOrError} in both cases, the output type of {c bind} must be {c ResultOrError}.

    So now we know the signature of {c bind}:
    {image src=images/string_ROE_bind_function.png}

    In Java this is written as:
    {code highlighter=none
        ResultOrError bind ( ResultOrError value, Function<String, ResultOrError> function )
    code}

    Implementing {c bind} is easy, because we know exactly what needs to be done:
    {insert_code highlighter=none file=[[examples_root]]/test_04/MonadTest_04.java \
        from_regex = "// start bind\R" \
        include_from_regex = no \
        to_regex = "\R\s*// end bind" \
        include_to_regex = no }

    Function {c enthuse} can now be rewritten as follows:
    {insert_code highlighter=none file=[[examples_root]]/test_04/MonadTest_04.java \
        from_regex = "// start enthuse_1\R" \
        include_from_regex = no \
        to_regex = "\R\s*// end enthuse_1" \
        include_to_regex = no }

    But this is still imperative code (a sequence of statements). If we did a good job, then we must be able to rewrite {c enthuse} by just using function composition. And indeed, we can do it like this:
    {insert_code highlighter=none file=[[examples_root]]/test_04/MonadTest_04.java \
        from_regex = "// start enthuse_2\R" \
        include_from_regex = no \
        to_regex = "\R\s*// end enthuse_2" \
        include_to_regex = no }

    At first sight the body of {c bind} might be a bit confusing. We will change that later. The point is that we use only function composition in the body of {c enthuse}.
    
    {note
        If you never saw this kind of code before, then please take your time to digest and fully understand what's going on here.
        
        Understanding {c bind} is the key to understanding monads!

        {c bind} is the function name used in Haskell. There are alternative names, such as: {c flatMap}, {c chain}, {c andThen}.
    }

    Does it work correctly? Let's test it. Here is a class containing {c bind}, the two variations of {c enthuse}, and some simplistic tests that cover the success and all error paths:
    {insert_code highlighter=none file=[[examples_root]]/test_04/MonadTest_04.java from_regex="public class MonadTest_04"}

    Running function {c tests} outputs:
    {output
        Result: HELLO BOB!
        Result: HELLO BOB!
        Error: String must contain non-space characters.
        Error: String must contain non-space characters.
        Error: String must contain only letters and spaces.
        Error: String must contain only letters and spaces.
        Error: String must not exceed 20 characters.
        Error: String must not exceed 20 characters.    
    output}

    The {c bind} function defined above serves our specific problem. But to make it part of a monad we will have to make it more general. We will do that soon.

    {note
        Using {c bind} as shown above, is the common way to solve our problem of function composition. But it's not the only way. An alternative is called {i Kleisli composition} (out of the scope of this article).
    }
}