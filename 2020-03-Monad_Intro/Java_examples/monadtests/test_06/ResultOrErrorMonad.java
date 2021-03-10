package monadtests.test_06;

import monadtests.test_03.SimpleError;

import java.util.function.Function;

public class ResultOrErrorMonad<R> {
    
    private final R result;
    private final SimpleError error;
    
    public ResultOrErrorMonad ( R result ) {
        this.result = result;
        this.error = null;
    }

    public ResultOrErrorMonad( SimpleError error ) {
        this.result = null;
        this.error = error;
    }
    
    public R getResult() { return result; }
    
    public SimpleError getError() { return error; }
    
    public boolean isResult() { return error == null; }
    
    public boolean isError() { return error != null; }
    
    static <R1, R2> ResultOrErrorMonad<R2> bind ( ResultOrErrorMonad<R1> value, Function<R1, ResultOrErrorMonad<R2>> function ) {
        
        if ( value.isResult() ) {
            return function.apply ( value.result );
        } else {
            return new ResultOrErrorMonad<R2> ( value.error );
        }
    }

    public String toString() {

        if ( isResult() ) {
            return "Result: " + result.toString(); 
        } else {
            return "Error: " + error.toString(); 
        }
    }
}
