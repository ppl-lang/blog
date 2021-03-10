package monadtests.test_03;

public class StringFunctions {

    public static ResultOrError trim ( String string ) {
        
        String result = string.trim();
        if ( result.isEmpty() ) {
            return new ResultOrError ( new SimpleError (
                "String must contain non-space characters." ) );
        }

        return new ResultOrError ( result );
    }
    
    public static ResultOrError toUpperCase ( String string ) {
        
        if ( ! string.matches ( "[a-zA-Z ]+" ) ) {
            return new ResultOrError ( new SimpleError (
                "String must contain only letters and spaces." ) );
        }
        
        return new ResultOrError ( string.toUpperCase() );
    }
    
    public static ResultOrError appendExclam ( String string ) {
        
        if ( string.length() > 20 ) {
            return new ResultOrError ( new SimpleError (
                "String must not exceed 20 characters." ) );
        }

        return new ResultOrError ( string.concat ( "!" ) );
    }
}
