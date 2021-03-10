{ch Errors, But No Exceptions id=errors

    For the sake of this tutorial, suppose that our functions can fail in the following ways:
    {list
        {el Function {c trim} fails if the input string is empty or contains only spaces (i.e. the result cannot be an empty string).}
        {el Function {c toUpperCase} fails if the input string is empty or contains characters others than letters or spaces.}
        {el Function {c appendExclam} fails if the input string is more than 20 characters long.}
    }

    In idiomatic Java an exception is thrown to indicate an error. But pure functional programming languages don't support exceptions, because a function cannot have a side-effect. A function that can fail must return error information as part of the result returned by the function. For example, the function returns a string in case of success, or error data in case of an error.
    
    So let's do that in Java.

    First we define a simple error class with an {c info} field that describes the error:
    {insert_code highlighter=none file=[[examples_root]]/test_03/SimpleError.java from_regex="public class SimpleError"}

    As said already, the functions must be able to return a string in case of success, or else an error object. To achieve this we can define class {c ResultOrError}:
    {insert_code highlighter=none file=[[examples_root]]/test_03/ResultOrError.java from_regex="public class ResultOrError"}

    As we can see:
    {list
        {el The class has two immutable fields to hold either a result or an error}
        {el
            There are two constructors.
            
            The first one is used in case of success (e.g. {c return new ResultOrError ( "hello");} ).
            
            The second constructor is used in case of failure (e.g. {c return new ResultOrError ( new Error ( "Something went wrong") );} ).
        }
        {el {c isResult} and {c isError} are utility functions}
        {el {c toString} is overridden for debugging purposes}
    }

    Now we can rewrite the three utility functions to include error handling:
    {insert_code highlighter=none file=[[examples_root]]/test_03/StringFunctions.java from_regex="public class StringFunctions"}
    
    {note
        To keep this exercise code simple, we don't check and handle {c null} values (as we would do in production code). For example, if a function is called with {c null} as input we simply accept that a {c NullPointerException} is thrown.
    }

    What matters is that the three functions who previously returned a string, now return a {c ResultOrError} object.

    As a consequence, function {c enthuse} that was defined as follows:
    {code highlighter=none
        static String enthuse ( String sentence ) {
            return appendExclam ( toUpperCase ( trim ( sentence ) ) );
        }
    code}
    ... doesn't work anymore.

    Unfortunately, function composition is now invalid, because the functions now return a {c ResultOrError} object, but require a {c string} as input. The output/input types don't match anymore. The functions can't be chained anymore.
    
    In the previous version, when the functions returned strings, the output of a function could be fed as input to the next function:
    {nl}
    {image src=images/string_functions_chains.png width=700}
    {caption Chained String Functions}

    But now this can't be done anymore:
    {nl}
    {image src=images/string_ROE_functions.png width=700}

    However, we can still implement {c enthuse} {i in Java} like this:
    {insert_code highlighter=none file=[[examples_root]]/test_03/MonadTest_03.java \
        from_regex = "// start enthuse_1\R" \
        include_from_regex = no \
        to_regex = "\R\s*// end enthuse_1" \
        include_to_regex = no }

    Not good! The initial simple one-liner has turned into an ugly monster.

    We can improve a bit:
    {insert_code highlighter=none file=[[examples_root]]/test_03/MonadTest_03.java \
        from_regex = "// start enthuse_2\R" \
        include_from_regex = no \
        to_regex = "\R\s*// end enthuse_2" \
        include_to_regex = no }

    This kind of code works in Java and many other programming languages. But it's certainly not the code we want to write over and over again. Error handling code intermixed with normal flow makes code difficult to read, write, and maintain.
    
    More importantly, we simply can't write code like this in pure functional programming languages. Remember: An expression returned by a function is made up of {i function composition}.

    It's easy to image other cases that lead to the same dilemma. And what should we do in situations where the same problem appears in many variations? Yes, we should try to find a general solution that can be used in a maximum of cases.

    Monads to the rescue!

    Monads provide a general solution for this kind of problem, and they have other benefits as well. As we will see later, monads enable function composition for so-called monadic functions that cannot be composed directly because their types are incompatible.

    Some people say: "You could have invented monads if they didn't exist." (for example Brian Beckman in his excellent presentation {link url="https://www.youtube.com/watch?v=ZhuHCtR3xq8" text=Don't fear the Monad}) {- http://blog.sigfpe.com/2006/08/you-could-have-invented-monads-and.html -}

    That's true!

    So let's try to find a solution ourselves, temporarily ignoring the fact that a monad would solve our problem.
}
