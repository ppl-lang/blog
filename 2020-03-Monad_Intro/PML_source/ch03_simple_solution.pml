{ch A Simple Solution in Java

    In most programming languages this is trivial to do. Here is a solution in Java:
    {insert_code highlighter=none file = ../input/examples/test_01/MonadTest_01.java \
        from_regex = "    static String enthuse" \
        to_regex = "    }" }

    To write a complete Java 'application' including a rudimentary test, we can put the code below in file {c MonadTest_01.java}:
    {insert_code highlighter=none file = ../input/examples/test_01/MonadTest_01.java}

    Then we can compile and run the program with the following commands:
    {input
        javac MonadTest_01.java
        java MonadTest_01
    input}

    The output looks as expected:
    {output
        HELLO BOB!
    output}

    So far so good.
}
