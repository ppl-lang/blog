package monadtests.test_07;

import monadtests.test_03.SimpleError;

public class MonadTest_07 {

    public static ResultOrError<String, SimpleError> trim ( String string ) {
        
        String r = string.trim();
        if ( ! r.isEmpty() ) {
            return ResultOrError.createResult ( r );
        } else {
            return ResultOrError.createError ( new SimpleError ( "String must contain non-space characters." ) );
        }
    }
    
    public static ResultOrError<String, SimpleError> toUpperCase ( String string ) {
        
        if ( ! string.matches ( "[a-zA-Z ]+" ) ) {
            return ResultOrError.createError ( new SimpleError ( "String must contain only letters." ) );
        }
        
        return ResultOrError.createResult ( string.toUpperCase() );
    }
    
    public static ResultOrError<String, SimpleError> appendExclam ( String string ) {
        
        if ( string.length() > 20 ) {
            return ResultOrError.createError ( new SimpleError ( "String must not exceed 20 characters." ) );
        }

        return ResultOrError.createResult ( string.concat ( "!" ) );
    }

    static ResultOrError<String, SimpleError> enthuse_1 ( String sentence ) {
        
        ResultOrError<String, SimpleError> trimmed = trim ( sentence );
        ResultOrError<String, SimpleError> upperCased = trimmed.bind ( MonadTest_07::toUpperCase );
        ResultOrError<String, SimpleError> result = upperCased.bind ( MonadTest_07::appendExclam );

        return result;
    }

    static ResultOrError<String, SimpleError> enthuse_2 ( String sentence ) {
        
        ResultOrError<String, SimpleError> trimmed = trim ( sentence );
        ResultOrError<String, SimpleError> upperCased = trimmed.bind ( v -> toUpperCase(v) );
        return upperCased.bind ( v -> appendExclam(v) );
    }

    static ResultOrError<String, SimpleError> enthuse_3 ( String sentence ) {
        
        return trim ( sentence ).bind ( MonadTest_07::toUpperCase ).bind ( MonadTest_07::appendExclam );
    }

    static ResultOrError<String, SimpleError> enthuse_4 ( String sentence ) {
        
        return trim ( sentence ).bind ( v -> toUpperCase(v) ).bind ( v -> appendExclam(v) );
    }

    private static void test ( String sentence ) {

        System.out.println ( enthuse_1 ( sentence ) );
        System.out.println ( enthuse_2 ( sentence ) );
        System.out.println ( enthuse_3 ( sentence ) );
        System.out.println ( enthuse_4 ( sentence ) );
    }
    
    public static void tests() {
        
        test ( "  Hello bob  " );
        test ( "   " );
        test ( "hello 123" );
        test ( "Krungthepmahanakhon is the capital of Thailand" );
    }
}
