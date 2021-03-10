package monadtests.test_02;

public class MonadTest_02 {
    
    // start example
    static String trim ( String string ) {
        return string.trim();
    }
    
    static String toUpperCase ( String string ) {
        return string.toUpperCase();
    }
    
    static String appendExclam ( String string ) {
        return string.concat ( "!" );
    }

    static String enthuse ( String sentence ) {
        return appendExclam ( toUpperCase ( trim ( sentence ) ) );
    }

    public static void test() {
        System.out.println ( enthuse ( "  Hello bob  " ) );
    }
    // end example
}
