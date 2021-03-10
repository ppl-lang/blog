{ch Maximizing Reusability

    Besides having a type parameter for the result value, we could also add a type parameter for the error value. This makes the monad more reusable, because users of the monad are now free to decide which type of error they want to use. For an example you can look at F#'s {link url=https://docs.microsoft.com/en-us/dotnet/fsharp/language-reference/results text=Result} type.

    Finally we could make the monad even more reusable by letting the user define the meaning of the two values. In our example, one value represents a result, and the other one represents an error. But we can abstract more. We can create a monad that simply holds one of two possible values - either value_1 or value_2. And the type of each value can be freely defined by a type parameter. This is indeed a standard monad supported by some functional programming languages. In Haskell it's called {c Either}. It's constructor is defined as follows:
    {code highlighter=none
        data Either a b = Left a | Right b
    code}

    Using our {c ResultOrErrorMonad} class as a starting point, it would be easy to create an {c Either} monad in Java.

    {note
        Some projects use an {c Either} monad for functions that might fail. In my opinion, using a more specific {c ResultOrError} type is a better, less error-prone option (for reasons not explained here).
    }
{-
    {note
        Some projects use an {c Either} monad for functions that might fail. Im my opinion, using a more specific {c ResultOrError} type is a better option. The reason is that the fields in {c Either} are typically named {c left} and {c right}. The actual meaning of these fields depends on the use case. If {c Either} is used for error-handling then {link url=http://hackage.haskell.org/package/base-4.12.0.0/docs/Data-Either.html text=by convention} {c left} is used to store errors, and {c right} is used to store success values. But this can be error-prone, for example if the value and the error are strings.
    }
-}
}