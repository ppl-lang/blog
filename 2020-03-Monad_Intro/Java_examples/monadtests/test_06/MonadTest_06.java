package monadtests.test_06;

import static monadtests.test_06.ResultOrErrorMonad.bind;
import static monadtests.test_06.MonadStringFunctions.*;

public class MonadTest_06 {

    static ResultOrErrorMonad<String> enthuse_1 ( String sentence ) {
        
        ResultOrErrorMonad<String> trimmed = trim ( sentence );
        ResultOrErrorMonad<String> upperCased = ResultOrErrorMonad.bind ( trimmed, MonadStringFunctions::toUpperCase );
        // ResultOrError upperCased_2 = bind ( trimmed, s -> toUpperCase(s) );
        ResultOrErrorMonad<String> result = ResultOrErrorMonad.bind ( upperCased, MonadStringFunctions::appendExclam );
        return result;
    }

    static ResultOrErrorMonad<String> enthuse_2 ( String sentence ) {
        
        return bind ( bind ( trim ( sentence ), MonadStringFunctions::toUpperCase ), MonadStringFunctions::appendExclam );
    }

    static ResultOrErrorMonad<String> enthuse_3 ( String sentence ) {
        
        return bind ( bind ( trim ( sentence ), v -> toUpperCase(v) ), v -> appendExclam(v) );
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
