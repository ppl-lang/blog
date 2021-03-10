{ch Summary

    The key to understanding monads is to understand {c bind} (also called {c chain}, {c andThen}, etc.). Function {c bind} is used to compose two monadic functions. A monadic function is a function that takes a value of type T and returns an object that contains the value ({c a -> m a}). Monadic functions cannot be directly composed because the output type of the first function called is not compatible to the input type of the second function. {c bind} solves this problem.

    Function {c bind} is useful on its own. But it's just one part of a monad.

    In Java-like world, a monad is a class (type) {c M} with:
    {list
        {el a type parameter {c T} tat defines the type of the value stored in the monad (e.g. {c M<T>})}
        
        {el
            a constructor that takes a value of type {c T} and returns a monad {c M<T>} containing the value
            {list
                {el
                    Java-like languages:{nl}{c M<T> create ( T value )}
                    {image src=images/create_function.png}
                }
                {el Haskell:{nl}{c return :: a -> m a}}
            }
        }
        {el a {c bind} function used to compose two monadic functions
            {list
                {el
                    Java-like languages:{nl}{c M<T2> bind ( M<T1> monad, Function<T1, M<T2>> function )}
                    {image src=images/generic_bind_function.png}
                }
                {el Haskell:{nl}{c (>>=) :: m a -> (a -> m b) -> m b}}
            }
        }
    }

    A monad must respect three monad laws. These laws ensure that the monad behaves well in all situations.
    
    Monads are primarily used in functional programming languages, because these languages rely on function composition. But they can also be useful in the context of other paradigms, such as object-oriented programming languages that support generic types and higher order functions.
}
