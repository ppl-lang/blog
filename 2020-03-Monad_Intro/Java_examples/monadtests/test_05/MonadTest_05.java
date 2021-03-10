package monadtests.test_05;

import static monadtests.test_05.MonaStringFunctions.trim;
import static monadtests.test_05.ResultOrErrorMona.bind;

public class MonadTest_05 {

    static ResultOrErrorMona<String> enthuse_1 ( String sentence ) {
        
        ResultOrErrorMona<String> trimmed = trim ( sentence );
        ResultOrErrorMona<String> upperCased = ResultOrErrorMona.bind ( trimmed, MonaStringFunctions::toUpperCase );
        // ResultOrError upperCased_2 = bind ( trimmed, s -> toUpperCase(s) );
        ResultOrErrorMona<String> result = ResultOrErrorMona.bind ( upperCased, MonaStringFunctions::appendExclam );
        return result;
    }

    static ResultOrErrorMona<String> enthuse_2 ( String sentence ) {
        
        return ResultOrErrorMona.bind ( ResultOrErrorMona.bind ( trim ( sentence ), MonaStringFunctions::toUpperCase ), MonaStringFunctions::appendExclam );
    }

    static ResultOrErrorMona<String> enthuse_3 ( String sentence ) {
        
        return bind ( bind ( trim ( sentence ), MonaStringFunctions::toUpperCase ), MonaStringFunctions::appendExclam );
    }

    private static void test ( String sentence ) {

        System.out.println ( enthuse_1 ( sentence ) );
        System.out.println ( enthuse_2 ( sentence ) );
        System.out.println ( enthuse_3 ( sentence ) );
    }
    
    public static void tests() {
        
        test ( "  Hello bob  " );
        test ( "   " );
        test ( "hello 123" );
        test ( "Krungthepmahanakhon is the capital of Thailand" );
    }
}
