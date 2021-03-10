{ch Function Composition

    In functional programming languages, nested function calls (like our {c appendExclam ( toUpperCase ( trim ( sentence ) ) )}) are called {i function composition}.
    
    {adm label=Important
        Function {i composition} is the bread and butter of functional programming languages. In the lambda calculus, the body of a function is a single expression. Complex expressions can be created by composing functions.
    }

    {nl}
    {image src=images/function_composition.png}
    {caption Function composition}

    As we will see later, monads provide a solution to a problem that can arise when we compose functions. Before going on, let us therefore see variations of using function composition in different environments. Readers familiar with this important concept can jump to the {xref node_id=errors text=next} chapter.

    {ch Unix Pipes

        First, it is interesting to note that the idea of function composition is similar to {link url=https://www.geeksforgeeks.org/piping-in-unix-or-linux/ text=pipes in Unix/Linux}. The output of a first command is fed as input into a second command. Then the output of the second command is fed as input into a third command, and so on. In Unix/Linux the symbol {c |} is used to pipe commands. Here is an example of a pipe that counts the number of files containing {c "page"} in their name (example borrowed from {link url=https://www.howtogeek.com/438882/how-to-use-pipes-on-linux/ text=How to Use Pipes on Linux}):

        {code highlighter=none
            ls - | grep "page" | wc -l
        code}
    }

    {ch Pipe Operator

        Because pipes are useful in many contexts, some programming languages have a specific {i pipe operator}. For example, F# uses {c |>} to chain function calls. If Java had this operator, then function {c enthuse} could be written as:
        {code highlighter=none
            static String enthuse ( String sentence ) {
                return trim ( sentence ) |> toUpperCase |> appendExclam;
            }
        code}
        ... which would semantically be the same, but a bit more readable than real Java that uses nested function calls:
        {code highlighter=none
            static String enthuse ( String sentence ) {
                return appendExclam ( toUpperCase ( trim ( sentence ) ) );
            }
        code}
    }

    {ch Function Composition Operator

        As function composition is essential, most functional programming languages have a dedicated {i function composition operator} that makes it trivial to compose functions.

        For example, in Haskell a dot ({c .}) is used to compose functions (derived from the ring operator symbol {verbatim &#x2218;} used in maths). The dot is itself a function whose signature is defined as follows:
        {code highlighter=none
            (.) :: (b -> c) -> (a -> b) -> a -> c
        code}
        This tells us that the function takes two functions as input ({c b -> c} and {c a -> b}), and returns another function ({c a -> c}), which is the composition of the two input functions.

        Hence, to state that function {c h} is the composition of functions {c f} and {c g}, in Haskell you can simply write:
        {code highlighter=none
            h = f . g
        code}
        Note the totally different semantics of the dot operator in Haskell and object oriented languages like C#, Java, etc. In Java, {c f.g} means applying {c g} on object {c f} (e.g. {c person.name}). In Haskell it means composing functions {c f} and {c g}.

        F# uses {c >>} to compose functions. It is defined like this:
        {code highlighter=none
            let (>>) f g x = g(f(x))
        code}
        And it is used as follows:
        {code highlighter=none
            let h = f >> g
        code}
        Note: F#'s {c >>} operator must not be confused with the {i Monad sequencing operator} in Haskell, which also uses the symbol {c >>}.

        If Java had a syntax similar to F# for function composition, then function {c enthuse} could simply be written as follows:
        {code highlighter=none
            static String enthuse ( String sentence ) = trim >> toUpperCase >> appendExclam;
        code}
    }
}
