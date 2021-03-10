{ch Introduction

    Monads are heavily used in most functional programming languages. In Haskell, for example, they are essential and appear everywhere, in all kinds of applications and libraries.

    On the other hand, monads are {i rarely} used in popular, non-pure-functional programming languages like C#, Java, Python, etc.

    Why is there such a big discrepancy?

    To find the answer we first have to know:

    {list
        {el What is a monad?}
        {el Why are they used in functional languages? What's the problem(s) they solve?}
        {el How could we use monads in languages like C#, Java, Python, etc.? Should we do that?}
    }

    After reading this article you'll hopefully be able to answer these questions without hesitation.

    {note
        This article is primarily written for software developers with a good background in non-pure-functional programming languages.
        
        Examples in this article are shown in Java. But readers are not required to be Java experts, because only basic Java is used. The examples would look very similar in C#, and they could easily be rewritten in other languages that support generic types (type parameters) and higher order functions (functions that can take a function as input argument, and return functions).

        The full source code is available on {link url=[[Gitlab_root]]/Java_examples/monadtests text=Gitlab}.
    }
}