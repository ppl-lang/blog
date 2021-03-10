package monadtests.test_03;

import static monadtests.test_03.StringFunctions.*; 

public class MonadTest_03 {

    // start enthuse_1
    static ResultOrError enthuse ( String sentence ) {
        
        ResultOrError trimmed = trim ( sentence );
        if ( trimmed.isResult() ) {
            ResultOrError upperCased = toUpperCase ( trimmed.getResult() );
            if ( upperCased.isResult() ) {
                return appendExclam ( upperCased.getResult() );
            } else {
                return upperCased;
            }
        } else {
            return trimmed;
        }
    }
    // end enthuse_1

    // start enthuse_2
    static ResultOrError enthuse_2 ( String sentence ) {
        
        ResultOrError trimmed = trim ( sentence );
        if ( trimmed.isError() ) return trimmed;
        
        ResultOrError upperCased = toUpperCase ( trimmed.getResult() );
        if ( upperCased.isError() ) return upperCased;
        
        return appendExclam ( upperCased.getResult() );
    }
    // end enthuse_2

    private static void test ( String sentence ) {

        System.out.println ( enthuse ( sentence ) );
        System.out.println ( enthuse_2 ( sentence ) );
    }
    
    public static void tests() {
        
        test ( "  Hello bob  " );
        test ( "   " );
        test ( "hello 123" );
        test ( "Krungthepmahanakhon is the capital of Thailand" );
    }
}
