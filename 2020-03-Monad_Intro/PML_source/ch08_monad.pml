{ch A Monad, Finally!

    Now that we have {c bind}, the remaining steps to get to the monad are easy. We just need to make some improvements in order to have a more general solution that can be applied in other cases too.

    Our goal in this chapter is clear: See the pattern and improve {c ResultOrError}, so that we can finally enthuse:
    
    "A MONAD!"

    {b First improvement:}

    In the previous chapter we defined {c bind} as an isolated function that fulfilled our specific needs. A first improvement is to move {c bind} into the {c ResultOrError} class. Function {c bind} must be part of our monad class. The reason is that the implementation of {c bind} depends on the monad that uses {c bind}. While the {i signature} of {c bind} is always the same, different kinds of monads use different {i implementations}.

{-
    So {c ResultOrError} now becomes:

    Note the class name: {c ResultOrErrorMona}. This is not a typo. The class isn't a monad yet, so I call it a mona (just for fun).
-}    

    {b Second Improvement:}

    In our example code, the composed functions all take a string as input, and return either a string or an error. What if we have to compose functions that take an integer, and return an integer or error? Can we improve {c ResultOrError} so that it works with {i any} type of result? Yes, we can. We just have to add a type parameter to {c ResultOrError}.

    After moving {c bind} into the class and adding a type parameter, the new version now becomes:
    {insert_code highlighter=none file=[[examples_root]]/test_05/ResultOrErrorMona.java from_regex = "public class ResultOrErrorMona"}

    Note the class name: {c ResultOrErrorMona}. This is not a typo. The class isn't a monad yet, so I call it a mona (just for fun).

    {b Third Improvement:}

    Suppose we have to chain the following two functions:
    {code highlighter=none
        ResultOrError<Integer> f1 ( Integer value )
        ResultOrError<String>  f2 ( Integer value )
    code}
    Here is a picture to illustrate this:
    {image src=images/integer_string_functions_chain.png}

    Our current {c bind} function is not able to handle this case, because the output types of the two functions are different ({c ResultOrError<Integer>} and {c ResultOrError<String>}). We have to make {c bind} more general, so that functions of different value types can be chained. The signature of {c bind} must be changed from
    {code highlighter=none
        static <R> Monad<R> bind ( Monad<R> monad, Function<R, Monad<R>> function )
    code}
    ... to
    {code highlighter=none
        static <R1, R2> Monad<R2> bind ( Monad<R1> monad, Function<R1, Monad<R2>> function )
    code}
    The implementation of {c bind} must be adapted too. Here is the new class:
    {insert_code highlighter=none file=[[examples_root]]/test_06/ResultOrErrorMonad.java \
        from_regex = "public class ResultOrErrorMonad" \
        id=ResultOrErrorMonad}

    Note the class name again: {c ResultOrErrorMonad}.
    
    Yes, now it's a monad.

    {note
        In the real world we don't add a "monad" suffix for types that are monads. I called the class {c ResultOrErrorMonad} (instead of simply  {c ResultOrError}) to make it clear that the class is a monad.
    }
    
    How can we be sure the class is indeed a monad?

    While the term 'monad' has a very precise definition in mathematics (as everything in maths), the term isn't yet unequivocally defined in the world of programming languages. However, Wikipedia states a {link url=https://en.wikipedia.org/wiki/Monad_(functional_programming)#Definition text=common definition}. A monad consists of three parts:
    {list
        {el
            {b A type constructor M that builds up a monadic type M T.}

            In other words, there is a type parameter for the value contained in the monad.

            In our case it's type parameter {c R} in the class declaration:
            {code highlighter=none
                class ResultOrErrorMonad<R>
            code}
{-
            In an object-oriented programming language, this means there must be a class that represents a monad.

            In our case it's class {c ResultOrErrorMonad<R>}.

            {note
                Our {c ResultOrErrorMonad} has type parameter {c R} to make it more versatile, in a type-safe way. But this is not a requirement of a monad.
                
                In a language without generics, we could as well create type-safe classes {c StringOrErrorMonad}, {c IntegerOrErrorMonad}, etc. 
                
                Or, in a dynamically typed language we could create a type-unsafe class {c ResultOrErrorMonad} that would accept any type of value inside the monad.
            }
-}
        }
        {el
            {b A type converter, often called unit or return, that embeds an object x in the monad: {c unit(x) : T → M T}}

            In Haskell, the type converter is defined as: {c return :: a -> m a}

            In Java-like languages, this means there must be a constructor that takes a value of type {c R}, and returns a monad {c M<R>} that contains this value.

            In our specific case it's the constructor of class {c ResultOrErrorMonad}:
            {code highlighter=none
                public ResultOrErrorMonad ( R result ) 
            code}
        }
        {el
            {b A combinator, typically called bind (as in binding a variable) and represented with an infix operator >>=, that unwraps a monadic variable, then inserts it into a monadic function/expression, resulting in a new monadic value: {c (mx >>= f) : (M T, T → M U) → M U}}

            In Haskell, bind is defined as: {c (>>=) :: m a -> (a -> m b) -> m b}

            In our example it's the {c bind} function:
            {code highlighter=none
                <R1, R2> ResultOrErrorMonad<R2> bind ( ResultOrErrorMonad<R1> value, Function<R1, ResultOrErrorMonad<R2>> function )
            code}
        }
    }

    Wikipedia then states: "To fully qualify as a monad though, these three parts must also respect a few laws: ..."

    In {link url=https://hackage.haskell.org/package/base-4.12.0.0/docs/Control-Monad.html#t:Monad text=Haskell} the three laws as defined as follows:
    {list
        {el {c return a >>= k  =  k a}}
        {el {c m >>= return  =  m}}
        {el {c m >>= (\x -> k x >>= h)  =  (m >>= k) >>= h}}
    }

    Discussing these laws is out of scope of this article (this is an {i introduction} to monads). The laws ensure that monads behave well in all situations. Violating them can lead to subtle and painful bugs as explained {link url=https://www.reddit.com/r/haskell/comments/16iakr/what_happens_when_a_monad_violates_monadic_laws/ text=here},  {link url=https://stackoverflow.com/questions/12617664/a-simple-example-showing-that-io-doesnt-satisfy-the-monad-laws text=here}, and  {link url=https://www.quora.com/What-would-be-the-practical-implications-if-an-implementation-of-Haskells-Monad-typeclass-didnt-satisfy-the-monadic-laws text=here}{- demonstrated in {link url=https://www.sitepoint.com/how-optional-breaks-the-monad-laws-and-why-it-matters/ text=How Optional Breaks the Monad Laws and Why It Matters})-}. As far as I know, there is currently no compiler able to enforce the monad laws. Hence, it's the developer's responsibility to verify that the monad laws are respected. Suffice to say that the above {c ResultOrErrorMonad} fulfills the monad laws.

    Although we are done, there is still room for improvement.
}