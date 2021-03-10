package monadtests.test_04;

import java.util.function.Function;

import monadtests.test_03.ResultOrError;
import monadtests.test_03.StringFunctions; 

import static monadtests.test_03.StringFunctions.*; 


public class MonadTest_04 {

    // start bind
    static ResultOrError bind ( ResultOrError value, Function<String, ResultOrError> function ) {
        
        if ( value.isResult() ) {
            return function.apply ( value.getResult() );
        } else {
            return value;
        }
    }
    // end bind

    // start enthuse_1
    static ResultOrError enthuse ( String sentence ) {
        
        ResultOrError trimmed = trim ( sentence );
        
        ResultOrError upperCased = bind ( trimmed, StringFunctions::toUpperCase );
        // alternative:
        // ResultOrError upperCased = bind ( trimmed, string -> toUpperCase(string) );
        
        ResultOrError result = bind ( upperCased, StringFunctions::appendExclam );
        return result;
    }
    // end enthuse_1

    // start enthuse_2
    static ResultOrError enthuse_2 ( String sentence ) {
        
        return bind ( bind ( trim ( sentence ), StringFunctions::toUpperCase ), StringFunctions::appendExclam );
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
