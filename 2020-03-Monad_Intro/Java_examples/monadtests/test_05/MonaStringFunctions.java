package monadtests.test_05;

import monadtests.test_03.SimpleError;

public class MonaStringFunctions {

    public static ResultOrErrorMona<String> trim ( String string ) {
        
        String r = string.trim();
        if ( ! r.isEmpty() ) {
            return new ResultOrErrorMona<String> ( r );
        } else {
            return new ResultOrErrorMona<String> ( new SimpleError ( "String must contain non-space characters." ) );
        }
    }
    
    public static ResultOrErrorMona<String> toUpperCase ( String string ) {
        
        if ( ! string.matches ( "[a-zA-Z ]+" ) ) {
            return new ResultOrErrorMona<String> ( new SimpleError ( "String must contain only letters." ) );
        }
        
        return new ResultOrErrorMona<String> ( string.toUpperCase() );
    }
    
    public static ResultOrErrorMona<String> appendExclam ( String string ) {
        
        if ( string.length() > 20 ) {
            return new ResultOrErrorMona<String> ( new SimpleError ( "String must not exceed 20 characters." ) );
        }

        return new ResultOrErrorMona<String> ( string.concat ( "!" ) );
    }
}
