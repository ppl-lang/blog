package monadtests.test_06;

import monadtests.test_03.SimpleError;

public class MonadStringFunctions {

    public static ResultOrErrorMonad<String> trim ( String string ) {
        
        String r = string.trim();
        if ( ! r.isEmpty() ) {
            return new ResultOrErrorMonad<> ( r );
        } else {
            return new ResultOrErrorMonad<> ( new SimpleError ( "String must contain non-space characters." ) );
        }
    }
    
    public static ResultOrErrorMonad<String> toUpperCase ( String string ) {
        
        if ( ! string.matches ( "[a-zA-Z ]+" ) ) {
            return new ResultOrErrorMonad<> ( new SimpleError ( "String must contain only letters." ) );
        }
        
        return new ResultOrErrorMonad<> ( string.toUpperCase() );
    }
    
    public static ResultOrErrorMonad<String> appendExclam ( String string ) {
        
        if ( string.length() > 20 ) {
            return new ResultOrErrorMonad<> ( new SimpleError ( "String must not exceed 20 characters." ) );
        }

        return new ResultOrErrorMonad<> ( string.concat ( "!" ) );
    }
}
